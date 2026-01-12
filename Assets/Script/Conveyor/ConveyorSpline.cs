using UnityEngine;
using Unity.Mathematics;
using Unity.VisualScripting;
using System.Collections.Generic;


[ExecuteInEditMode]
public class ConveyorSpline : MonoBehaviour
{
    [SerializeField] private float3 StartPoint;
    [SerializeField] private float3 StartDirection;


    [SerializeField] private float3 EndPoint;
    [SerializeField] private float3 EndDirection;

    [SerializeField] private Transform Start;
    [SerializeField] private Transform End;

    [SerializeField] private float ArcRadius = 1f;

    [SerializeField]
    public bool ShowGizmos = false;

    [SerializeField]
    public float Length = 0f;

    public void Evaluate(float t, out float3 position, out float3 direction, out float3 upVector)
    {
        // 确保t在0-1范围内
        StartPoint = Start.position;
        StartDirection = Start.forward; // 指向 x 轴
        EndPoint = End.position;//这里寻找的是世界坐标
        EndDirection = End.forward;//forward指向y轴
        float endPointY = EndPoint.y;
        EndPoint.y = StartPoint.y;//保持高度一致

        t = Mathf.Clamp01(t);


        //算法部分


        //双圆弧切线算法------------------------------------
        //首先根据起点到终点连线方向和起点方向计算起点圆心
        float3 startDirNorm = math.normalize(StartDirection);
        float3 endDirNorm = math.normalize(EndDirection);
        float3 startToEndDir = math.normalize(EndPoint - StartPoint);
        float3 startCenter, endCenter;
        float3 startCenterToEndCenterDir;




        if (math.cross(startDirNorm, startToEndDir).y < 0)//（负左正右  左手坐标系）
            startCenter = StartPoint + math.cross(startDirNorm, new float3(0, 1, 0)) * ArcRadius;
        else
            startCenter = StartPoint - math.cross(startDirNorm, new float3(0, 1, 0)) * ArcRadius;

        //过终点做起始圆的切线
        float3 startCenterToEndDir = math.normalize(EndPoint - startCenter);
        float3 startCenterToStartPointDir = math.normalize(StartPoint - startCenter);
        float angle = math.acos(ArcRadius / math.length(EndPoint - startCenter));
        //转动，绕Y轴旋转正角度是顺时针,（1，0，0）会转成（0，0，-1）

        //注意两条切线，选择
        //如果起点圆心在起点方向左边，则选择顺时针旋转的切线，否则选择逆时针旋转的切线
        if (math.cross(startDirNorm, startCenterToStartPointDir).y < 0)
            angle = -angle;
        quaternion rot = quaternion.AxisAngle(new float3(0, 1, 0), angle);
        float3 startCenterToStartTangentDir1 = math.mul(rot, startCenterToEndDir);
        float3 startTangent1 = startCenter + startCenterToStartTangentDir1 * ArcRadius;
        float3 startTangentToEndDir = math.normalize(EndPoint - startTangent1);


        //根据startTangentToEndDir和终点方向计算终点圆心
        if (math.cross(startTangentToEndDir, endDirNorm).y < 0)
            endCenter = EndPoint + math.cross(endDirNorm, new float3(0, 1, 0)) * ArcRadius;
        else
            endCenter = EndPoint - math.cross(endDirNorm, new float3(0, 1, 0)) * ArcRadius;



        //反过来重新确定起点圆心
        //过起点做终点圆的切线
        float3 endCenterToStartDir = math.normalize(StartPoint - endCenter);
        float3 endCenterToEndPointDir = math.normalize(EndPoint - endCenter);
        float angle2 = math.acos(ArcRadius / math.length(StartPoint - endCenter));

        if (math.cross(endDirNorm, endCenterToEndPointDir).y > 0)
            angle2 = -angle2;
        quaternion rot2 = quaternion.AxisAngle(new float3(0, 1, 0), angle2);
        float3 endCenterToEndTangentDir1 = math.mul(rot2, endCenterToStartDir);
        float3 endTangent1 = endCenter + endCenterToEndTangentDir1 * ArcRadius;
        float3 endTangentToStartDir = math.normalize(StartPoint - endTangent1);
        //根据endTangentToStartDir和起点方向重新计算起点圆心
        if (math.cross(startDirNorm, endTangentToStartDir).y > 0)
            startCenter = StartPoint + math.cross(startDirNorm, new float3(0, 1, 0)) * ArcRadius;
        else
            startCenter = StartPoint - math.cross(startDirNorm, new float3(0, 1, 0)) * ArcRadius;





        //接下来就要计算两个圆的公切线了

        //四种情况，如果起始圆心在起始方向左边 终点圆心在终点方向左边 则是外切线1
        startCenterToEndCenterDir = math.normalize(endCenter - startCenter);
        float3 startPointToStartCenterDir = math.normalize(startCenter - StartPoint);
        float3 endPointToEndCenterDir = math.normalize(endCenter - EndPoint);
        float3 startTangent, endTangent;
        bool startclockwise, endclockwise;//圆弧方向

        if (math.cross(startDirNorm, startPointToStartCenterDir).y < 0 && math.cross(endDirNorm, endPointToEndCenterDir).y < 0)//起始圆心在起始方向左边 终点圆心在终点方向左边 则是外切线1
        {

            // 计算切线
            startTangent = startCenter - math.cross(startCenterToEndCenterDir, new float3(0, 1, 0)) * ArcRadius;
            endTangent = endCenter - math.cross(startCenterToEndCenterDir, new float3(0, 1, 0)) * ArcRadius;
            startclockwise = false;
            endclockwise = false;
        }

        //起始圆心在起始方向左边 终点圆心在终点方向右边 则是内切线1
        else if (math.cross(startDirNorm, startPointToStartCenterDir).y < 0 && math.cross(endDirNorm, endPointToEndCenterDir).y > 0)
        {

            // 计算切线
            float tangentAngle = math.acos((2 * ArcRadius) / math.length(endCenter - startCenter));//切点与圆心连线的夹角
            startTangent = startCenter + math.mul(quaternion.AxisAngle(new float3(0, 1, 0), tangentAngle), startCenterToEndCenterDir) * ArcRadius;//顺时针转
            endTangent = endCenter + math.mul(quaternion.AxisAngle(new float3(0, 1, 0), tangentAngle),
            -startCenterToEndCenterDir) * ArcRadius;//顺时针转,调换了连线方向


            //endTangent.y = EndPoint.y;//保持高度一致,bug补丁


            startclockwise = false;
            endclockwise = true;
            //打印切点y坐标
            //Debug.Log($"startTangent.y:{startTangent.y} endTangent.y:{endTangent.y}");
        }

        //起始圆心在起始方向右边 终点圆心在终点方向左边 则是内切线2
        else if (math.cross(startDirNorm, startPointToStartCenterDir).y > 0 && math.cross(endDirNorm, endPointToEndCenterDir).y < 0)
        {

            // 计算切线
            float tangentAngle = math.acos((2 * ArcRadius) / math.length(endCenter - startCenter));//切点与圆心连线的夹角
            startTangent = startCenter + math.mul(quaternion.AxisAngle(new float3(0, 1, 0), -tangentAngle), startCenterToEndCenterDir) * ArcRadius;//逆时针转
            endTangent = endCenter + math.mul(quaternion.AxisAngle(new float3(0, 1, 0), -tangentAngle), -startCenterToEndCenterDir) * ArcRadius;//逆时针转,调换了连线方向
            startclockwise = true;
            endclockwise = false;
        }

        //起始圆心在起始方向右边 终点圆心在终点方向右边 则是外切线2

        else if (math.cross(startDirNorm, startPointToStartCenterDir).y > 0 && math.cross(endDirNorm, endPointToEndCenterDir).y > 0)
        {

            // 计算切线
            startTangent = startCenter + math.cross(startCenterToEndCenterDir, new float3(0, 1, 0)) * ArcRadius;
            endTangent = endCenter + math.cross(startCenterToEndCenterDir, new float3(0, 1, 0)) * ArcRadius;
            startclockwise = true;
            endclockwise = true;
        }

        else//否则说明起点终点方向设置有问题，直接直线连接
        {
            Debug.LogWarning("起点终点方向设置有问题，直接直线连接");
            startTangent = StartPoint;
            endTangent = EndPoint;
            startclockwise = false;
            endclockwise = false;
        }




        //切换回正常高度差的情况
        EndPoint.y = endPointY;

        endTangent.y = endPointY;//保持高度一致,bug补丁
        endCenter.y = endPointY;




        //计算各段长度分配时间比例
        float startArcAngle = CalculateArcAngle(startCenter, StartPoint, startTangent, startclockwise) * ArcRadius;

        float lineLength = math.length(endTangent - startTangent);

        float endArcAngle = CalculateArcAngle(endCenter, endTangent, EndPoint, endclockwise) * ArcRadius;

        float totalLength = startArcAngle + lineLength + endArcAngle;
        Length = totalLength;

        float startArcT = startArcAngle / totalLength;
        float lineT = lineLength / totalLength;
        float endArcT = endArcAngle / totalLength;
        //Debug.Log($"startArcT:{startArcT} lineT:{lineT} endArcT:{endArcT} total:{startArcT + lineT + endArcT}");
        //根据t值落在哪一段，计算位置和方向
        if (t < startArcT)//起始圆弧段
        {
            float localT = t / startArcT;
            EvaluateArc(startCenter, StartPoint, startTangent, startclockwise, localT, out position, out direction);
        }
        else if (t < startArcT + lineT)//直线段
        {
            float localT = (t - startArcT) / lineT;
            position = math.lerp(new float3(startTangent.x, StartPoint.y, startTangent.z), endTangent, localT);
            direction = math.normalize(endTangent - startTangent);
        }
        else//终点圆弧段
        {
            float localT = (t - startArcT - lineT) / endArcT;
            EvaluateArc(endCenter, endTangent, EndPoint, endclockwise, localT, out position, out direction);
        }


        // 默认向上向量
        upVector = Vector3.up;

        // -------------------------------------------------



        // 默认向上向量
        /*
        upVector = Vector3.up;

        // 转换到世界空间
        position = transform.TransformPoint(position);
        direction = transform.TransformDirection(direction);
        upVector = transform.TransformDirection(upVector);
        */
        //算法部分
    }

    private float CalculateArcAngle(float3 center, float3 startPoint, float3 endPoint, bool clockwise)
    {
        float3 startVec = math.normalize(startPoint - center);
        float3 endVec = math.normalize(endPoint - center);
        float dot = math.dot(startVec, endVec);
        dot = math.clamp(dot, -1f, 1f); // 防止浮点数误差导致的异常
        float angle = math.acos(dot);

        float3 cross = math.cross(startVec, endVec);
        if (clockwise && cross.y < 0 || !clockwise && cross.y > 0)
        {
            angle = 2 * math.PI - angle;
        }

        return angle;

    }
    private void EvaluateArc(float3 center, float3 startPoint, float3 endPoint, bool clockwise, float t, out float3 position, out float3 direction)
    {
        float3 startVec = math.normalize(startPoint - center);
        float3 endVec = math.normalize(endPoint - center);
        float dot = math.dot(startVec, endVec);
        dot = math.clamp(dot, -1f, 1f); // 防止
        float angle = math.acos(dot);
        float3 cross = math.cross(startVec, endVec);
        if (clockwise && cross.y < 0 || !clockwise && cross.y > 0)
        {
            angle = 2 * math.PI - angle;
        }

        float3 axis = new float3(0, 1, 0); // 绕Y轴旋转
        float3 rotatedVec = math.mul(quaternion.AxisAngle(axis, angle * t * (clockwise ? 1 : -1)), startVec);
        position = center + rotatedVec * ArcRadius;
        direction = math.normalize(math.cross(axis, rotatedVec) * (clockwise ? 1 : -1));

    }




    private void OnDrawGizmos()
    {
        if (!ShowGizmos) return;
        StartPoint = Start.position;
        StartDirection = Start.forward;
        EndPoint = End.position;
        EndDirection = End.forward;

        float3 startDirNorm = math.normalize(StartDirection);
        float3 endDirNorm = math.normalize(EndDirection);

        float3 startToEndDir = math.normalize(EndPoint - StartPoint);
        float3 startCenter, endCenter;

        if (math.cross(startDirNorm, startToEndDir).y < 0)
            startCenter = StartPoint + math.cross(startDirNorm, new float3(0, 1, 0)) * ArcRadius;
        else
            startCenter = StartPoint - math.cross(startDirNorm, new float3(0, 1, 0)) * ArcRadius;

        float3 startCenterToEndDir = math.normalize(EndPoint - startCenter);
        float3 startCenterToStartPointDir = math.normalize(StartPoint - startCenter);
        float angle = math.acos(ArcRadius / math.length(EndPoint - startCenter));
        if (math.cross(startDirNorm, startCenterToStartPointDir).y < 0)
            angle = -angle;
        quaternion rot = quaternion.AxisAngle(new float3(0, 1, 0), angle);
        float3 startCenterToStartTangentDir1 = math.mul(rot, startCenterToEndDir);
        float3 startTangent1 = startCenter + startCenterToStartTangentDir1 * ArcRadius;
        float3 startTangentToEndDir = math.normalize(EndPoint - startTangent1);

        if (math.cross(startTangentToEndDir, endDirNorm).y < 0)
            endCenter = EndPoint + math.cross(endDirNorm, new float3(0, 1, 0)) * ArcRadius;
        else
            endCenter = EndPoint - math.cross(endDirNorm, new float3(0, 1, 0)) * ArcRadius;


        //反过来重新确定起点圆心
        //过起点做终点圆的切线
        float3 endCenterToStartDir = math.normalize(StartPoint - endCenter);
        float3 endCenterToEndPointDir = math.normalize(EndPoint - endCenter);
        float angle2 = math.acos(ArcRadius / math.length(StartPoint - endCenter));

        if (math.cross(endDirNorm, endCenterToEndPointDir).y > 0)
            angle2 = -angle2;
        quaternion rot2 = quaternion.AxisAngle(new float3(0, 1, 0), angle2);
        float3 endCenterToEndTangentDir1 = math.mul(rot2, endCenterToStartDir);
        float3 endTangent1 = endCenter + endCenterToEndTangentDir1 * ArcRadius;
        float3 endTangentToStartDir = math.normalize(StartPoint - endTangent1);
        //根据endTangentToStartDir和起点方向重新计算起点圆心
        if (math.cross(startDirNorm, endTangentToStartDir).y > 0)
            startCenter = StartPoint + math.cross(startDirNorm, new float3(0, 1, 0)) * ArcRadius;
        else
            startCenter = StartPoint - math.cross(startDirNorm, new float3(0, 1, 0)) * ArcRadius;


        float3 startCenterToEndCenterDir = math.normalize(endCenter - startCenter);
        float3 startPointToStartCenterDir = math.normalize(startCenter - StartPoint);
        float3 endPointToEndCenterDir = math.normalize(endCenter - EndPoint);
        float3 startTangent, endTangent;
        bool startclockwise, endclockwise;

        if (math.cross(startDirNorm, startPointToStartCenterDir).y < 0 && math.cross(endDirNorm, endPointToEndCenterDir).y < 0)
        {
            startTangent = startCenter - math.cross(startCenterToEndCenterDir, new float3(0, 1, 0)) * ArcRadius;
            endTangent = endCenter - math.cross(startCenterToEndCenterDir, new float3(0, 1, 0)) * ArcRadius;
            startclockwise = false;
            endclockwise = false;
        }
        else if (math.cross(startDirNorm, startPointToStartCenterDir).y < 0 && math.cross(endDirNorm, endPointToEndCenterDir).y > 0)
        {
            float tangentAngle = math.acos((2 * ArcRadius) / math.length(endCenter - startCenter));
            startTangent = startCenter + math.mul(quaternion.AxisAngle(new float3(0, 1, 0), tangentAngle), startCenterToEndCenterDir) * ArcRadius;
            endTangent = endCenter + math.mul(quaternion.AxisAngle(new float3(0, 1, 0), tangentAngle), -startCenterToEndCenterDir) * ArcRadius;
            startclockwise = false;
            endclockwise = true;
        }
        else if (math.cross(startDirNorm, startPointToStartCenterDir).y > 0 && math.cross(endDirNorm, endPointToEndCenterDir).y < 0)
        {
            float tangentAngle = math.acos((2 * ArcRadius) / math.length(endCenter - startCenter));
            startTangent = startCenter + math.mul(quaternion.AxisAngle(new float3(0, 1, 0), -tangentAngle), startCenterToEndCenterDir) * ArcRadius;
            endTangent = endCenter + math.mul(quaternion.AxisAngle(new float3(0, 1, 0), -tangentAngle), -startCenterToEndCenterDir) * ArcRadius;
            startclockwise = true;
            endclockwise = false;
        }
        else if (math.cross(startDirNorm, startPointToStartCenterDir).y > 0 && math.cross(endDirNorm, endPointToEndCenterDir).y > 0)
        {
            startTangent = startCenter + math.cross(startCenterToEndCenterDir, new float3(0, 1, 0)) * ArcRadius;
            endTangent = endCenter + math.cross(startCenterToEndCenterDir, new float3(0, 1, 0)) * ArcRadius;
            startclockwise = true;
            endclockwise = true;
        }
        else
        {
            startTangent = StartPoint;
            endTangent = EndPoint;
            startclockwise = false;
            endclockwise = false;
        }

        // 绘制圆心
        Gizmos.color = Color.red;
        Gizmos.DrawSphere(startCenter, 0.1f);
        Gizmos.color = Color.blue;
        Gizmos.DrawSphere(endCenter, 0.1f);

        // 绘制圆心连线
        Gizmos.color = Color.cyan;
        Gizmos.DrawLine(startCenter, endCenter);

        // 绘制圆心连线
        Gizmos.color = Color.cyan;
        Gizmos.DrawLine(StartPoint, EndPoint);

        Gizmos.color = Color.red;
        Gizmos.DrawLine(StartPoint, endTangent1);

        // 绘制起点方向和终点方向
        Gizmos.color = Color.green;
        Gizmos.DrawLine(StartPoint, StartPoint + startDirNorm * 0.5f);
        Gizmos.DrawLine(EndPoint, EndPoint + endDirNorm * 0.5f);

        // 绘制完整曲线
        Gizmos.color = Color.yellow;
        int segmentCount = 50;
        float3 prevPos;
        Evaluate(0, out prevPos, out _, out _);
        for (int i = 1; i <= segmentCount; i++)
        {
            float t = i / (float)segmentCount;
            float3 pos, dir;
            Evaluate(t, out pos, out dir, out _);
            Gizmos.DrawLine(prevPos, pos);
            prevPos = pos;
            // 每隔5段打印一次方向
            if (i % 5 == 0)
            {
                Gizmos.color = Color.yellow;
                Gizmos.DrawLine(pos, pos + dir * 0.3f);

                // 箭头两翼
                float3 left = math.mul(quaternion.AxisAngle(new float3(0, 1, 0), math.radians(150)), dir);
                float3 right = math.mul(quaternion.AxisAngle(new float3(0, 1, 0), math.radians(-150)), dir);
                Gizmos.DrawLine(pos + dir * 0.3f, pos + dir * 0.2f + left * 0.1f);
                Gizmos.DrawLine(pos + dir * 0.3f, pos + dir * 0.2f + right * 0.1f);
            }
        }

        // 绘制各个切线（起点圆弧切线、终点圆弧切线、直线段切线）
        Gizmos.color = Color.magenta;
        // 起点圆弧切线
        Gizmos.DrawLine(StartPoint, startTangent);
        // 终点圆弧切线
        Gizmos.DrawLine(EndPoint, endTangent);
        // 公切线段
        Gizmos.color = Color.red;
        Gizmos.DrawLine(startTangent, endTangent);


    }
}
