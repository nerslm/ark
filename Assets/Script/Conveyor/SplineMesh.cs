using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;
using Unity.Mathematics;
using UnityEditor;
using Unity.VisualScripting;

[ExecuteInEditMode]
public class SplineMesh : MonoBehaviour
{
    [SerializeField]
    private int resolution = 10;
    private ConveyorSampler m_splineSampler;
    private List<Vector3> m_vertsP1;
    private List<Vector3> m_vertsP2;
    [SerializeField]
    private MeshFilter m_meshFilter;

    public bool BuildMeshOnEditMode = true;

    private void Awake()
    {
        m_splineSampler = GetComponent<ConveyorSampler>();
        m_meshFilter = GetComponent<MeshFilter>();

    }

    private void Update()
    {
        if (!BuildMeshOnEditMode) return;
        GetVerts();
        BuildMesh();
    }

    public void GetVerts()
    {
        m_vertsP1 = new List<Vector3>();
        m_vertsP2 = new List<Vector3>();
        float step = 1f / (float)resolution;

        for (int i = 0; i <= resolution; i++)
        {
            float t = step * i;
            m_splineSampler.SampleSplineWidth(t, out Vector3 p1, out Vector3 p2);

            // **关键修改：转换为本地坐标方便旋转根物体**
            Vector3 localP1 = transform.InverseTransformPoint(p1);
            Vector3 localP2 = transform.InverseTransformPoint(p2);

            m_vertsP1.Add(localP1);
            m_vertsP2.Add(localP2);
        }


    }

    private void OnDrawGizmos()
    {
        if (m_vertsP1 != null && m_vertsP2 != null)
        {
            for (int i = 0; i < m_vertsP1.Count; i++)
            {
                // **本地坐标转世界坐标绘制**
                Vector3 worldP1 = transform.TransformPoint(m_vertsP1[i]);
                Vector3 worldP2 = transform.TransformPoint(m_vertsP2[i]);
                Gizmos.DrawLine(worldP1, worldP2);
            }
        }
    }

    public bool BuildMesh()
    {
   

        Mesh m = new Mesh();
        List<Vector3> verts = new List<Vector3>();
        List<int> tris = new List<int>();
        List<Vector2> uvs = new List<Vector2>();

        int offset = 0;
        int length = m_vertsP2.Count;
        float uvOffset = 0f; // UV偏移量，用于累积距离
        float uvDistance = 0f; // 当前段的UV距离

        for (int currentSplineIndex = 0; currentSplineIndex < 1; currentSplineIndex++)
        {
            int splineOffset = resolution * currentSplineIndex;
            splineOffset += currentSplineIndex;

            // 重置每条样条曲线的UV偏移
            uvOffset = 0f;

            //Iterate verts and build a face
            for (int currentSplinePoint = 1; currentSplinePoint < resolution + 1; currentSplinePoint++)
            {
                int vertOffset = splineOffset + currentSplinePoint;
                Vector3 p1 = m_vertsP1[vertOffset - 1];
                Vector3 p2 = m_vertsP2[vertOffset - 1];
                Vector3 p3 = m_vertsP1[vertOffset];
                Vector3 p4 = m_vertsP2[vertOffset];

                // 计算当前段的距离
                float distance = Vector3.Distance((p1 + p2) * 0.5f, (p3 + p4) * 0.5f); // 统计的mesh的中点线为距离
                uvDistance = uvOffset + distance;

                offset = 4 * resolution * currentSplineIndex;
                offset += 4 * (currentSplinePoint - 1);

                int t1 = offset + 0;
                int t2 = offset + 2;
                int t3 = offset + 3;
                int t4 = offset + 3;
                int t5 = offset + 1;
                int t6 = offset + 0;

                verts.AddRange(new List<Vector3> { p1, p2, p3, p4 });
                tris.AddRange(new List<int> { t1, t2, t3, t4, t5, t6 });

                // 基于距离的UV坐标
                uvs.AddRange(new List<Vector2> {
                    new Vector2(uvOffset, 0),    // p1: 起点左边
                    new Vector2(uvOffset, 1),    // p2: 起点右边
                    new Vector2(uvDistance, 0),  // p3: 终点左边
                    new Vector2(uvDistance, 1)   // p4: 终点右边
                });

                // 累积距离作为下一段的起始UV偏移
                uvOffset += distance;
            }
        }
        // 顶点有效性检查
        foreach (var v in verts)
        {
            if (float.IsNaN(v.x) || float.IsNaN(v.y) || float.IsNaN(v.z) ||
                float.IsInfinity(v.x) || float.IsInfinity(v.y) || float.IsInfinity(v.z))
            {
                //Debug.LogWarning("Mesh顶点数据异常，跳过生成！");
                return false;
            }
        }

        if (verts.Count < 4)
        {
            //Debug.LogWarning("Mesh顶点数量不足，跳过生成！");
            return false;
        }



        m.SetVertices(verts);
        m.SetTriangles(tris, 0);
        m.SetUVs(0, uvs); // 如果有UV
        m.RecalculateNormals();
        m_meshFilter.mesh = m;


        return true;

    }
}
