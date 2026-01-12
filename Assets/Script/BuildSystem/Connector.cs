using UnityEngine;
using System;
using System.Collections.Generic;

public class Connector : MonoBehaviour
{
    #region 吸附点设置
    [Serializable]
    public class SnapPoint
    {
        [Header("匹配设置")]
        public BuildingType acceptedType;           // 接受的建筑类型

        [Header("变换设置")]
        public Vector3 localPosition = Vector3.zero;    // 本地位置偏移
        public Vector3 localRotation = Vector3.zero;    // 本地旋转偏移
        public Vector3 localScale = Vector3.one;        // 缩放设置

        [Header("状态")]
        [SerializeField] private bool isOccupied = false;    // 是否被占用

        // 运行时属性
        public bool IsOccupied => isOccupied;// 是否被占用
        public Building ConnectedBuilding { get; private set; }

        // 世界坐标属性
        public Vector3 GetWorldPosition(Transform connectorTransform)
        {
            return connectorTransform.TransformPoint(localPosition);
        }

        public Quaternion GetWorldRotation(Transform connectorTransform)
        {
            return connectorTransform.rotation * Quaternion.Euler(localRotation);
        }

        public void SetOccupied(Building building)
        {
            isOccupied = true;
            ConnectedBuilding = building;
        }

        public void SetFree()
        {
            isOccupied = false;
            ConnectedBuilding = null;
        }
    }

    [Header("连接器设置")]
    [SerializeField] private List<SnapPoint> snapPoints = new List<SnapPoint>();
    [SerializeField] private float detectionRadius = 1.5f;
    [SerializeField] private bool isDisabled = false;


    [Header("物理检测设置")]
    [SerializeField] private Vector3 physicsDetectionSize = Vector3.one * 0.25f;  // 物理检测范围


    public List<SnapPoint> SnapPoints => snapPoints;
    public float DetectionRadius => detectionRadius;
    public bool IsEnabled => !isDisabled && gameObject.activeInHierarchy;
    #endregion

    #region 私有变量
    private Building ownerBuilding;
    private SphereCollider detectionCollider;

    // **物理检测缓存数组，避免GC**
    private readonly Collider[] detectResults = new Collider[10];// 缓存数组，避免每次调用都分配新内存
    #endregion

    #region Unity 生命周期
    void Awake()
    {
        ownerBuilding = GetComponentInParent<Building>();
        SetupDetectionCollider();
    }

    void Start()
    {
        RegisterConnector();
    }

    void OnDestroy()
    {
        //UnregisterConnector();
    }

    void OnDrawGizmosSelected()
    {
        DrawDebugGizmos();
    }
    #endregion

    #region 初始化
    private void SetupDetectionCollider()
    {
        detectionCollider = GetComponent<SphereCollider>();
        if (detectionCollider == null)
        {
            detectionCollider = gameObject.AddComponent<SphereCollider>();
        }

        detectionCollider.isTrigger = true;
        detectionCollider.radius = detectionRadius;

        // 设置到 Socket 图层
        if (gameObject.layer == 0) // 如果还在 Default 图层
        {
            gameObject.layer = LayerMask.NameToLayer("Socket");
        }
    }

    private void RegisterConnector()
    {
        // 注册到管理器（如果有的话）
        //ConnectorManager.Instance?.RegisterConnector(this);
    }

    private void UnregisterConnector()
    {
        // 从管理器注销
        //ConnectorManager.Instance?.UnregisterConnector(this);
    }
    #endregion

    #region 核心功能
    /// <summary>
    /// 查找可以连接指定建筑的最佳吸附点
    /// </summary>
    public SnapPoint FindBestSnapPoint(Building building, Vector3 fromPosition)
    {

        if (!IsEnabled || building == null) return null;
 
        SnapPoint bestPoint = null;
        float closestDistance = float.MaxValue;


        foreach (var point in snapPoints)
        {
            //对每个吸附点进行检测
            CheckOccupied(point, building);//这里会更新点的占用状态

            // 检查是否兼容且未被占用
            if (point.IsOccupied || point.acceptedType != building.Type)
                continue;

            // 计算距离
            Vector3 pointWorldPos = point.GetWorldPosition(transform);
            float distance = Vector3.Distance(fromPosition, pointWorldPos);

            if (distance < closestDistance)
            {
                closestDistance = distance;
                bestPoint = point;
            }
        }
        //Debug.Log(bestPoint != null ? $"找到最佳吸附点，距离: {closestDistance}" : "未找到合适的吸附点");

        return bestPoint;
    }
 
    /// <summary>
    /// 将建筑吸附到指定吸附点
    /// </summary>
    public bool SnapBuildingToPoint(Building building, SnapPoint snapPoint)
    {
        if (snapPoint == null || snapPoint.IsOccupied || !IsCompatible(building, snapPoint))
        {
            return false;
        }

        // 应用变换
        building.transform.position = snapPoint.GetWorldPosition(transform);
        building.transform.rotation = snapPoint.GetWorldRotation(transform);
        building.transform.localScale = snapPoint.localScale;

        // 建立连接
        //snapPoint.SetOccupied(building);//这个已经不重要了，因为CheckOccupied会更新状态

        //Debug.Log($"建筑 {building.name} 吸附到连接器 {name}");
        return true;
    }

    /// <summary>
    /// 断开建筑连接
    /// </summary>
    public bool DisconnectBuilding(Building building)
    {
        foreach (var point in snapPoints)
        {
            if (point.ConnectedBuilding == building)
            {
                point.SetFree();
                //Debug.Log($"建筑 {building.name} 从连接器 {name} 断开");
                return true;
            }
        }
        return false;
    }

    /// <summary>
    /// 检查建筑是否与吸附点兼容
    /// </summary>
    private bool IsCompatible(Building building, SnapPoint snapPoint)
    {
        return snapPoint.acceptedType == building.Type;
    }

    /// <summary>
    /// 检查连接器是否在指定位置的有效范围内
    /// </summary>
    public bool IsInRange(Vector3 position)
    {
        float distance = Vector3.Distance(transform.position, position);
        return distance <= detectionRadius;
    }

    //添加一个物理检测方法
    public bool CheckOccupied(SnapPoint snapPoint, Building targetBuilding)
    {
        if (snapPoint == null || targetBuilding == null) return true;

        Vector3 snapWorldPos = snapPoint.GetWorldPosition(transform);
        Quaternion snapWorldRot = snapPoint.GetWorldRotation(transform);

        // 使用物理检测：小范围OverlapBox
        int numColliders = Physics.OverlapBoxNonAlloc(
            snapWorldPos,
            physicsDetectionSize * 0.5f,  // OverlapBox 需要 halfExtents
            detectResults,
            snapWorldRot,
            Physics.AllLayers,
            QueryTriggerInteraction.Ignore
        );

        Building detectedBuilding = null;

        // 查找占用的建筑
        for (int i = 0; i < numColliders; i++)
        {
            if (detectResults[i] == null) continue;

            Building building = detectResults[i].GetComponentInParent<Building>();
            if (building != null && building != ownerBuilding)  // 排除自己
            {
                // **关键修改：检查是否与当前吸附点类型匹配**
                if (building.Type == snapPoint.acceptedType)//这里的building是检测到的建筑
                {
                    detectedBuilding = building;
                    break;
                }
            }
        }

        // 直接根据检测结果设置状态
        if (detectedBuilding != null)
        {
            snapPoint.SetOccupied(detectedBuilding);  // 只有匹配类型才设置占用
            return true;
        }
        else
        {
            snapPoint.SetFree();  // 没检测到匹配建筑就设置空闲
            return false;
        }
    }

    /// <summary>
    /// 获取所有可用的吸附点
    /// </summary>
    public List<SnapPoint> GetAvailableSnapPoints()
    {
        List<SnapPoint> available = new List<SnapPoint>();
        foreach (var point in snapPoints)
        {
            if (!point.IsOccupied)
            {
                available.Add(point);
            }
        }
        return available;
    }
    #endregion

    #region 调试可视化
    private void DrawDebugGizmos()
    {
        // 绘制检测范围
        Gizmos.color = IsEnabled ? Color.cyan : Color.gray;
        Gizmos.DrawWireSphere(transform.position, detectionRadius);

        // 绘制吸附点
        for (int i = 0; i < snapPoints.Count; i++)
        {
            var point = snapPoints[i];
            Vector3 worldPos = point.GetWorldPosition(transform);

            // 根据状态设置颜色
            Gizmos.color = point.IsOccupied ? Color.red : Color.green;
            Gizmos.DrawWireCube(worldPos, Vector3.one * 0.2f);

            // 绘制方向
            Quaternion worldRot = point.GetWorldRotation(transform);
            Gizmos.color = Color.blue;
            Gizmos.DrawRay(worldPos, worldRot * Vector3.forward * 0.5f);

            // 绘制连接线
            Gizmos.color = Color.yellow;
            Gizmos.DrawLine(transform.position, worldPos);
        }
    }

    void OnValidate()
    {
        // 编辑器中同步碰撞器大小
        if (detectionCollider != null)
        {
            detectionCollider.radius = detectionRadius;
        }
    }
    #endregion
}