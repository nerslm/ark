using UnityEngine;
using UnityEngine.Splines;
using Unity.Mathematics;
using UnityEditor;
using UnityEngine.Rendering.Universal.Internal;
using System.Security.Cryptography;

[ExecuteInEditMode] // 允许在编辑模式下运行
public class ConveyorSampler : MonoBehaviour
{
    private ConveyorSpline m_splineContainer;


    [SerializeField]
    [Range(0f, 1f)]
    private float m_time;

    [SerializeField]
    private float speed = 0.1f;
    [SerializeField]
    private float m_width = 1f;

    float3 position;
    float3 forward;
    float3 upVector;

    public float3 p1;
    public float3 p2;

    private void OnEnable()
    {
        m_splineContainer = GetComponent<ConveyorSpline>();
    }
    /*
    private void Update()
    {
        //m_time += Time.deltaTime * speed;
        //m_time = m_time % 1f;
        m_splineContainer.Evaluate(m_time, out position, out forward, out upVector);


        float3 right = Vector3.Cross(forward, upVector).normalized;
        p1 = position + (right * m_width);
        p2 = position - (right * m_width);

    }
    */
    public void SampleSplineWidth(float t, out Vector3 p1, out Vector3 p2)
    {
        if (m_splineContainer != null)
        {
            // 在指定的t值处计算样条曲线信息
            m_splineContainer.Evaluate( t, out float3 pos, out float3 tangent, out float3 up);

            // 计算右向量
            float3 right = Vector3.Cross(tangent, up).normalized;

            // 计算左右两个点
            p1 = pos + (right * m_width * 0.5f);  // 右边点
            p2 = pos - (right * m_width * 0.5f);  // 左边点
        }
        else
        {
            p1 = Vector3.zero;
            p2 = Vector3.zero;
        }
    }
    /*
    private void OnDrawGizmos()
    {
        Handles.matrix = transform.localToWorldMatrix;
        Handles.SphereHandleCap(0, position, Quaternion.identity, 1f, EventType.Repaint);
        Handles.DrawLine(p1, p2);

    }
    */
}
