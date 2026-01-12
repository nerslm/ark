using System.Collections;
using System.Collections.Generic;//使用Hashtable时，必须引入这个命名空间
using Unity.VisualScripting;
using UnityEngine;


public class BuildingPlacer : MonoBehaviour
{
    #region 基础设置

    [Header("General Settings")]
    public BuildMode CurrentBuildMode = BuildMode.NONE;
    public enum BuildMode { NONE, PLACE, DESTROY, EDIT }

    [Header("Building Prefabs")]
    [SerializeField] private GameObject[] buildingPrefabs;
    [SerializeField] private int selectedBuildingIndex = 0;

    [Header("Placement Settings")]
    [SerializeField] private LayerMask groundLayerMask = 1;
    [SerializeField] private Material previewMaterial;
    [SerializeField] private Color canPlaceColor = Color.green;
    [SerializeField] private Color cannotPlaceColor = Color.red;

    // 事件：建筑选择 ,UI调用
    public static event System.Action<int> OnBuildingSelected;

    #endregion
    public enum ViewType
    {
        FIRST_PERSON_VIEW,   // 第一人称
        THIRD_PERSON_VIEW,   // 第三人称
        TOP_DOWN_VIEW        // 俯视角
    }
    #region 射线设置（参考官方）
    [Header("Raycast Settings")]


    [SerializeField] private ViewType viewType = ViewType.THIRD_PERSON_VIEW;
    [SerializeField] private Transform fromTransform; // 第三人称时的射线起点（通常是角色）
    [SerializeField] private float raycastDistance = 10f;

    /// <summary>
    /// 获取射线发射点 - 参考官方逻辑
    /// </summary>
    private Transform GetCaster
    {
        get
        {
            if (viewType == ViewType.THIRD_PERSON_VIEW && fromTransform != null)
            {
                return fromTransform;
            }
            else
            {
                return playerCamera.transform;
            }
        }
    }
    #endregion


    public enum SnapDetectionMode { Raycast, Overlap }

    [Header("Snap Settings")]//吸附设置
    [SerializeField] private SnapDetectionMode snapMode = SnapDetectionMode.Overlap;
    [SerializeField] private LayerMask connectorLayerMask = 1 << 9;
    [SerializeField] private float snapRange = 5f; // 减小范围，更合理
    [SerializeField] private float maxSnapAngle = 30f;
    [SerializeField] private Color snapPreviewColor = Color.cyan;

    private Connector currentTargetConnector;//当前吸附的连接器
    private Connector.SnapPoint currentSnapPoint;
    private bool isSnappingToConnector = false;


    #region 私有变量
    private Camera playerCamera;
    private GameObject currentPreview;
    // **添加拆除系统变量**
    private GameObject currentDestroyTarget;    // 当前拆除目标
    private GameObject lastDestroyTarget;       // 上一个拆除目标
    private bool canDestroy = false;            // 是否可以拆除
    private bool canPlace = false;


    // **新增：传送带建造状态**
    private enum ConveyorPlaceState { Normal, WaitingStart, WaitingEnd }
    private ConveyorPlaceState conveyorState = ConveyorPlaceState.Normal;

    // **传送带起点信息**
    private Vector3 conveyorStartPosition;
    private Quaternion conveyorStartRotation;
    private bool conveyorStartSnapped = false;
    private Connector conveyorStartConnector = null;
    private Connector.SnapPoint conveyorStartSnapPoint = null;



    [Header("Destroy Settings")]
    [SerializeField] private Color destroyHighlightColor = Color.red;  // 拆除高亮颜色
    [SerializeField] private LayerMask buildingLayerMask = 6;         // 建筑图层蒙版，同时排除Player图层
    [SerializeField] private Material[] originalMaterials;

    // **新增：材质管理字典**
    private Dictionary<GameObject, Material[]> originalMaterialsDict = new Dictionary<GameObject, Material[]>();

    #endregion



    #region Unity生命周期
    void Start()
    {
        InitializePlacer();
    }

    void Update()
    {
        HandleCurrentMode();
        HandleInput();
    }
    #endregion

    #region 初始化
    private void InitializePlacer()
    {
        playerCamera = Camera.main;
        if (playerCamera == null)
        {
            playerCamera = FindFirstObjectByType<Camera>();
        }

        Debug.Log("BuildingPlacer 初始化完成");
    }
    #endregion

    #region 模式处理
    private void HandleCurrentMode()
    {
        switch (CurrentBuildMode)
        {
            case BuildMode.NONE:
                HandleNoneMode();
                break;
            case BuildMode.PLACE:
                HandlePlaceMode();
                break;
            case BuildMode.DESTROY:
                HandleDestroyMode();
                break;
            case BuildMode.EDIT:
                HandleEditMode();
                break;
        }
    }

    private void HandleNoneMode()
    {
        if (currentPreview != null)
        {
            DestroyPreview();
        }
    }

    private void HandlePlaceMode()
    {
        if (currentPreview == null)
        {
            CreatePreview();
        }

        // **传送带特殊处理**
        if (IsCurrentBuildingConveyor())
        {
            HandleConveyorPlaceMode();
        }
        else
        {
            // 普通建筑处理
            HandleConnectorSnapping();
            if (!isSnappingToConnector)
            {
                UpdatePreviewPosition();
            }
        }

        UpdatePreviewAppearance();
    }

    private void HandleDestroyMode()
    {
        // 清理放置模式的预览
        if (currentPreview != null)
        {
            DestroyPreview();
        }

        // 检测拆除目标
        GameObject targetBuilding = GetTargetBuilding();

        // **修复：正确的状态切换逻辑**
        if (targetBuilding != currentDestroyTarget)
        {
            // 目标改变了
            if (currentDestroyTarget != null)
            {
                // 恢复当前目标的外观
                RestoreBuildingAppearance(currentDestroyTarget);
            }

            // 更新目标
            currentDestroyTarget = targetBuilding;

            // 设置新目标的高亮
            if (currentDestroyTarget != null)
            {
                SaveOriginalMaterials(currentDestroyTarget); // **新增：保存原始材质**
                SetDestroyHighlight(currentDestroyTarget);
                canDestroy = CheckDestroyCondition();
            }
            else
            {
                canDestroy = false;
            }
        }
    }

    private void HandleEditMode()
    {
        Debug.Log("编辑模式暂未实现");
    }

    /// <summary>
    /// 处理传送带放置模式
    /// </summary>
    private void HandleConveyorPlaceMode()
    {
        //该模式下打开传送带的meshBuild,调用传送带中的splinemesh组件中的BuildMesh方法

        SplineMesh splineMesh = currentPreview.GetComponentInChildren<SplineMesh>();

        if (splineMesh != null)
        {
            //Debug.Log("传送带BuildMesh");
            splineMesh.GetVerts();
            splineMesh.BuildMesh();
        }


        if (conveyorState == ConveyorPlaceState.Normal || conveyorState == ConveyorPlaceState.WaitingStart)
        {
            // 起点阶段：Start连接器寻找吸附目标
            HandleConnectorSnapping();
            if (!isSnappingToConnector)
            {
                UpdatePreviewPosition();
            }
        }
        else if (conveyorState == ConveyorPlaceState.WaitingEnd)
        {
            // 终点阶段：End连接器寻找吸附目标并更新传送带形状
            HandleConnectorSnapping();
            UpdateConveyorEndPreview();
        }
    }

    /// <summary>
    /// 更新传送带终点预览
    /// </summary>
    private void UpdateConveyorEndPreview()
    {
        if (currentPreview == null) return;

        Vector3 endPosition;
        Quaternion endRotation;

        // 获取终点位置和旋转
        if (isSnappingToConnector && currentTargetConnector != null && currentSnapPoint != null)
        {
            // 终点吸附到连接器
            endPosition = currentSnapPoint.GetWorldPosition(currentTargetConnector.transform);
            endRotation = currentSnapPoint.GetWorldRotation(currentTargetConnector.transform);
        }
        else
        {
            // 终点自由放置
            Ray ray = playerCamera.ScreenPointToRay(Input.mousePosition);
            if (Physics.Raycast(ray, out RaycastHit hit, raycastDistance, groundLayerMask))
            {
                endPosition = hit.point;
            }
            else
            {
                endPosition = ray.origin + ray.direction * raycastDistance;
            }

            // 计算朝向（从起点到终点）
            Vector3 direction = (endPosition - conveyorStartPosition).normalized;
            endRotation = direction != Vector3.zero ? Quaternion.LookRotation(direction) : conveyorStartRotation;
        }

        // 更新传送带形状
        SetConveyorShape(currentPreview, conveyorStartPosition, conveyorStartRotation, endPosition, endRotation);

        // 检查放置条件
        float distance = Vector3.Distance(conveyorStartPosition, endPosition);
        canPlace = distance >= 1f && distance <= 50f; // 传送带长度限制
    }
    #endregion

    #region 预览建造系统
    private void CreatePreview()
    {
        if (buildingPrefabs == null || buildingPrefabs.Length == 0)
        {
            Debug.LogWarning("没有可用的建筑预制体！");
            return;
        }

        GameObject selectedPrefab = buildingPrefabs[selectedBuildingIndex];
        currentPreview = Instantiate(selectedPrefab);
        currentPreview.name = "Preview_" + selectedPrefab.name;

        SetupPreviewObject();
        Debug.Log($"创建预览：{currentPreview.name}");
    }

    private void SetupPreviewObject()
    {
        if (currentPreview == null) return;

        Collider[] colliders = currentPreview.GetComponentsInChildren<Collider>();
        foreach (Collider col in colliders)
        {
            col.enabled = false;
        }

        ChangePreviewMaterial(canPlaceColor);
    }

    /// <summary>
    /// 确保预览对象有Building组件
    /// </summary>


    private void UpdatePreviewPosition()
    {
        if (currentPreview == null) return;

        Ray ray = playerCamera.ScreenPointToRay(Input.mousePosition);
        Vector3 targetPosition;

        if (Physics.Raycast(ray, out RaycastHit hit, raycastDistance, groundLayerMask))
        {
            // **使用官方的GetLookPosition逻辑**
            targetPosition = GetLookPosition(hit);
            canPlace = CheckCanPlace(targetPosition);
        }
        else
        {
            targetPosition = GetLookDistance(ray);
            canPlace = CheckCanPlaceInAir(targetPosition);
        }

        currentPreview.transform.position = targetPosition;
    }

    /// <summary>
    /// 计算摄像机前方的距离位置 - 官方逻辑
    /// </summary>
    private Vector3 GetLookDistance(Ray ray)
    {
        if (currentPreview == null) return ray.origin + ray.direction * raycastDistance;

        Building building = currentPreview.GetComponent<Building>();
        if (building == null) return ray.origin + ray.direction * raycastDistance;

        // **步骤1：确定起始变换（官方逻辑）**
        Transform startTransform = (building.ClampHeight == 0) ? GetCaster : playerCamera.transform;
        Vector3 lookDistance = startTransform.position + playerCamera.transform.forward * raycastDistance;

        // **步骤2：检查是否启用高度限制（官方PreviewElevation逻辑）**
        if (building.ClampHeight > 0) // 相当于官方的PreviewElevation = true
        {
            float maxHeight;

            // **从当前预览位置向下检测地面**
            if (Physics.Raycast(currentPreview.transform.position + new Vector3(0, 0.3f, 0),
                Vector3.down, out RaycastHit hit, Mathf.Infinity, groundLayerMask))
            {
                float groundHeight = hit.point.y;
                maxHeight = groundHeight + building.ClampHeight; // 地面 + 限制高度
            }
            else
            {
                maxHeight = GetCaster.transform.position.y + building.ClampHeight; // Caster + 限制高度
            }

            // **限制Y坐标范围**
            lookDistance.y = Mathf.Clamp(lookDistance.y, -building.ClampHeight, maxHeight);
        }
        else
        {
            // **没有高度限制时：直接贴地（官方else分支）**
            if (Physics.Raycast(currentPreview.transform.position + new Vector3(0, 0.3f, 0),
                Vector3.down, out RaycastHit hit, Mathf.Infinity, groundLayerMask))
            {
                lookDistance.y = hit.point.y; // 直接设置到地面高度
            }
        }

        return lookDistance;
    }

    /// <summary>
    /// 计算地面位置 - 照着官方GetLookPosition
    /// </summary>
    private Vector3 GetLookPosition(RaycastHit hit)
    {
        if (currentPreview == null) return hit.point;

        Building building = currentPreview.GetComponent<Building>();
        if (building == null) return hit.point;

        // **步骤1：基础位置**
        Vector3 targetPoint = hit.point; // 你没有OffsetPosition，直接用击中点

        // **步骤2：位置限制（如果需要的话）**
        Vector3 clampedPoint = targetPoint; // 你没有ClampPosition设置，暂时跳过

        // **步骤3：网格对齐（关键：地基的厚度处理）**这里可以做一个如果是放置在地基上就启用网格对齐
        /*
        if (ShouldUseGridSnapping(building))
        {
            float gridSize = 1.0f; // 你的网格大小
                                   // **关键：地基的厚度设置**
            float halfHeight = GetBuildingThickness(building);

            Vector3 spawnPos = hit.point + hit.normal * 0.5f; // 向上偏移0.5f
            spawnPos.x = Mathf.Round(spawnPos.x / gridSize) * gridSize;
            spawnPos.y = Mathf.Floor(spawnPos.y / halfHeight) * halfHeight; // **这里决定了地基能否爬升**
            spawnPos.z = Mathf.Round(spawnPos.z / gridSize) * gridSize;
            clampedPoint = spawnPos;
        }
        */

        return clampedPoint;
    }

    /// <summary>
    /// 是否使用网格对齐 - 只有地基才启用
    /// </summary>
    private bool ShouldUseGridSnapping(Building building)
    {
        return building.Type == BuildingType.Foundation; // 只有地基启用网格对齐
    }

    /// <summary>
    /// 获取建筑厚度 - 地基使用0.5f，其他建筑使用0.1f
    /// </summary>
    private float GetBuildingThickness(Building building)
    {
        switch (building.Type)
        {
            case BuildingType.Foundation:
                return 0.5f; // **地基厚度0.5f，决定爬升步长**
            default:
                return 0.1f; // 其他建筑很薄，基本不爬升
        }
    }

    /// <summary>
    /// 悬空放置检查
    /// </summary>
    private bool CheckCanPlaceInAir(Vector3 position)
    {
        // 距离检查
        if (Vector3.Distance(GetCaster.position, position) > raycastDistance)
        {
            return false;
        }

        //加上墙壁和天花板必须吸附建造的逻辑
        // **关键：检查特定建筑类型是否需要强制吸附**
        Building building = currentPreview.GetComponent<Building>();
        if ((building.Type == BuildingType.Wall || building.Type == BuildingType.Floor) && !isSnappingToConnector)
        {
            return false; // 墙体和楼板必须吸附建造
        }

        // 吸附模式检查
        if (isSnappingToConnector)
        {
            return CheckSnapPlacement();
        }
        else
        {
            return CheckCollisionAtPosition(position);
        }
    }

    /// <summary>
    /// 检查指定位置是否有碰撞
    /// </summary>
    private bool CheckCollisionAtPosition(Vector3 position)
    {
        Collider previewCollider = currentPreview.GetComponent<Collider>();
        if (previewCollider != null)
        {
            // 临时移动到目标位置检查碰撞
            Vector3 originalPos = currentPreview.transform.position;
            currentPreview.transform.position = position;

            previewCollider.enabled = true;
            bool hasOverlap = Physics.CheckBox(
                previewCollider.bounds.center,
                previewCollider.bounds.extents,
                currentPreview.transform.rotation,
                ~groundLayerMask  // 排除地面图层，只检查其他建筑
            );
            previewCollider.enabled = false;

            // 恢复原位置
            currentPreview.transform.position = originalPos;

            return !hasOverlap;  // 没有重叠就可以放置
        }

        return true;  // 没有碰撞器默认可以放置
    }

    private bool CheckCanPlace(Vector3 position)
    {
        if (isSnappingToConnector)
        {
            return CheckSnapPlacement();
        }

        //加上墙壁和天花板必须吸附建造的逻辑
        // **关键：检查特定建筑类型是否需要强制吸附**
        Building building = currentPreview.GetComponent<Building>();
        if ((building.Type == BuildingType.Wall || building.Type == BuildingType.Floor) && !isSnappingToConnector)
        {
            return false; // 墙体和楼板必须吸附建造
        }



        Collider previewCollider = currentPreview.GetComponent<Collider>();
        if (previewCollider != null)
        {
            previewCollider.enabled = true;

            bool hasOverlap = Physics.CheckBox(
                previewCollider.bounds.center,
                previewCollider.bounds.extents,
                currentPreview.transform.rotation
            );

            previewCollider.enabled = false;
            return !hasOverlap;
        }

        return true;
    }

    private void UpdatePreviewAppearance()
    {
        if (currentPreview == null) return;

        Color targetColor;
        if (isSnappingToConnector)
        {
            targetColor = canPlace ? snapPreviewColor : cannotPlaceColor;
        }
        else
        {
            targetColor = canPlace ? canPlaceColor : cannotPlaceColor;
        }

        ChangePreviewMaterial(targetColor);
    }

    private void ChangePreviewMaterial(Color color)
    {
        if (currentPreview == null) return;

        Renderer[] renderers = currentPreview.GetComponentsInChildren<Renderer>();
        foreach (Renderer renderer in renderers)
        {
            Material tempMaterial = new Material(previewMaterial);
            tempMaterial.color = color;
            renderer.material = tempMaterial;
        }
    }

    private void DestroyPreview()
    {
        if (currentPreview != null)
        {
            Destroy(currentPreview);
            currentPreview = null;
            Debug.Log("销毁预览对象");
        }
    }
    #endregion

    #region 连接器吸附系统
    private readonly Collider[] overlapResults = new Collider[50];
    private readonly RaycastHit[] raycastHits = new RaycastHit[20];

    /// <summary>
    /// 处理连接器吸附逻辑 - 支持双模式
    /// </summary>
    private void HandleConnectorSnapping()
    {
        Connector nearestConnector = FindNearestConnector();

        if (nearestConnector != null && currentSnapPoint != null)
        {
            if (!isSnappingToConnector)
            {
                Debug.Log($"进入吸附模式 ({snapMode}): {nearestConnector.name}");
            }

            currentTargetConnector = nearestConnector;
            isSnappingToConnector = true;

            ApplySnapTransform();
            canPlace = CheckSnapPlacement();
        }
        else
        {
            if (isSnappingToConnector)
            {
                Debug.Log($"退出吸附模式 ({snapMode})");
                ExitSnappingMode();
            }
        }
    }

    /// <summary>
    /// 查找最近的连接器 - 根据模式选择检测方式
    /// </summary>
    private Connector FindNearestConnector()
    {
        if (currentPreview == null) return null;

        Building building = currentPreview.GetComponent<Building>();
        if (building == null) return null;

        currentSnapPoint = null;

        if (snapMode == SnapDetectionMode.Raycast)
        {
            return FindConnectorByRaycast(building);
        }
        else
        {
            return FindConnectorByOverlap(building);
        }
    }

    /// <summary>
    /// Raycast 检测模式
    /// </summary>
    private Connector FindConnectorByRaycast(Building building)
    {
        Ray ray = playerCamera.ScreenPointToRay(Input.mousePosition);


        if (Physics.Raycast(ray, out RaycastHit hit, snapRange, connectorLayerMask))
        {
            Connector connector = hit.collider.GetComponent<Connector>();
            if (connector != null && connector.IsEnabled)
            {

                Connector.SnapPoint snapPoint = connector.FindBestSnapPoint(building, currentPreview.transform.position);
                if (snapPoint != null)
                {
                    currentSnapPoint = snapPoint;
                    return connector;
                }
            }
        }

        return null;
    }

    /// <summary>
    /// Overlap 检测模式 - 修复第三人称视角
    /// </summary>
    private Connector FindConnectorByOverlap(Building building)
    {
        // **关键修改：使用 GetCaster 而不是摄像机位置**
        Vector3 detectionCenter = GetCaster.position;

        //Collider[] hitColliders = new Collider[50]; // 每次调用都创建新数组！GC垃圾！



        int numColliders = Physics.OverlapSphereNonAlloc(
            detectionCenter,
            snapRange,
            overlapResults, //hitColliders,
            connectorLayerMask,
            QueryTriggerInteraction.UseGlobal
        );

        //Debug.Log($"范围检测到 {numColliders} 个连接器");

        if (numColliders == 0) return null;

        Connector bestConnector = null;
        Connector.SnapPoint bestSnapPoint = null;
        float closestAngle = float.MaxValue;
        Ray cameraRay = playerCamera.ScreenPointToRay(Input.mousePosition);

        for (int i = 0; i < numColliders; i++)
        {


            Connector connector = overlapResults[i].GetComponent<Connector>();
            if (connector == null || !connector.IsEnabled)
            {
                continue;
            }

            // **使用官方的距离检查逻辑**
            if (!CloseFromPosition(connector.transform.position))
            {
                continue;
            }

            Connector.SnapPoint snapPoint = connector.FindBestSnapPoint(building, currentPreview.transform.position);
            if (snapPoint == null)
            {
                continue;
            }


            // 计算角度
            Vector3 snapWorldPos = snapPoint.GetWorldPosition(connector.transform);
            Vector3 directionToSnap = snapWorldPos - cameraRay.origin;
            float angle = Vector3.Angle(cameraRay.direction, directionToSnap);


            if (angle < closestAngle && angle < maxSnapAngle)
            {
                closestAngle = angle;
                bestConnector = connector;
                bestSnapPoint = snapPoint;

            }
        }

        if (bestConnector != null)
        {
            currentSnapPoint = bestSnapPoint;
        }

        return bestConnector;
    }

    /// <summary>
    /// 距离检查 - 参考官方逻辑，支持不同视角类型
    /// </summary>
    private bool CloseFromPosition(Vector3 position)
    {
        // 俯视角模式总是返回true（官方逻辑）
        if (viewType == ViewType.TOP_DOWN_VIEW)
        {
            return true;
        }
        //Debug
        // 其他模式使用Caster位置进行距离检查
        Vector3 casterPosition = GetCaster.position;
        float sqrDistance = (position - casterPosition).sqrMagnitude;
        float sqrSnapRange = snapRange * snapRange;
        bool isClose = sqrDistance < sqrSnapRange;

        return isClose;
    }

    private void ExitSnappingMode()
    {
        currentTargetConnector = null;
        currentSnapPoint = null;
        isSnappingToConnector = false;
    }

    private void ApplySnapTransform()
    {
        if (currentTargetConnector == null || currentSnapPoint == null || currentPreview == null)
            return;

        currentPreview.transform.position = currentSnapPoint.GetWorldPosition(currentTargetConnector.transform);
        currentPreview.transform.rotation = currentSnapPoint.GetWorldRotation(currentTargetConnector.transform);
        currentPreview.transform.localScale = currentSnapPoint.localScale;
    }

    private bool CheckSnapPlacement()
    {
        if (!isSnappingToConnector || currentTargetConnector == null || currentSnapPoint == null)
            return false;

        if (!currentTargetConnector.IsEnabled)
            return false;

        if (currentSnapPoint.IsOccupied)
            return false;

        Building buildingComponent = currentPreview.GetComponent<Building>();
        if (buildingComponent == null || currentSnapPoint.acceptedType != buildingComponent.Type)
            return false;

        return true;
    }
    #endregion
    #region 传送带辅助方法

    /// <summary>
    /// 检查当前选择的是否是传送带
    /// </summary>
    private bool IsCurrentBuildingConveyor()
    {
        if (buildingPrefabs == null || selectedBuildingIndex >= buildingPrefabs.Length)
            return false;

        GameObject selectedPrefab = buildingPrefabs[selectedBuildingIndex];
        Building building = selectedPrefab.GetComponent<Building>();

        bool isConveyor = building != null && building.Type == BuildingType.Conveyor;

        // **新增：进入传送带模式时设置状态**
        if (isConveyor && conveyorState == ConveyorPlaceState.Normal)
        {
            conveyorState = ConveyorPlaceState.WaitingStart;
            Debug.Log("进入传送带建造模式 - 等待设置起点");
        }

        return isConveyor;
    }

    /// <summary>
    /// 获取传送带的Start连接器
    /// </summary>
    private Transform GetConveyorStartConnector(GameObject conveyorObj)
    {
        return conveyorObj.transform.Find("Connectors/Start");
    }

    /// <summary>
    /// 获取传送带的End连接器  
    /// </summary>
    private Transform GetConveyorEndConnector(GameObject conveyorObj)
    {
        return conveyorObj.transform.Find("Connectors/End");
    }

    /// <summary>
    /// 检查连接器是否属于当前预览的传送带（排除自身）
    /// </summary>
    private bool IsOwnConnector(Connector connector)
    {
        if (currentPreview == null || connector == null) return false;

        // 检查连接器是否是当前预览物体的子物体
        Transform connectorTransform = connector.transform;
        Transform previewTransform = currentPreview.transform;

        return connectorTransform.IsChildOf(previewTransform);
    }

    /// <summary>
    /// 设置传送带形状（从起点到终点）
    /// </summary>
    private void SetConveyorShape(GameObject conveyorObj, Vector3 startPos, Quaternion startRot, Vector3 endPos, Quaternion endRot)
    {
        // 1. 设置根物体位置和旋转为起点
        conveyorObj.transform.position = startPos;
        conveyorObj.transform.rotation = startRot;

        // 2. 获取连接器
        Transform startConnector = GetConveyorStartConnector(conveyorObj);
        Transform endConnector = GetConveyorEndConnector(conveyorObj);

        if (startConnector != null)
        {
            // Start连接器保持在根物体位置
            startConnector.localPosition = Vector3.zero;
            startConnector.localRotation = Quaternion.identity;
        }

        if (endConnector != null)
        {
            // End连接器设置为终点的相对位置
            Vector3 endLocalPos = conveyorObj.transform.InverseTransformPoint(endPos);
            Quaternion endLocalRot = Quaternion.Inverse(conveyorObj.transform.rotation) * endRot;

            endConnector.localPosition = endLocalPos;
            endConnector.localRotation = endLocalRot;
        }
    }

    /// <summary>
    /// 重置传送带状态
    /// </summary>
    private void ResetConveyorState()
    {
        conveyorState = ConveyorPlaceState.Normal;
        conveyorStartSnapped = false;
        conveyorStartConnector = null;
        conveyorStartSnapPoint = null;
    }

    #endregion

    #region 拆除系统


    /// <summary>
    /// 保存建筑的原始材质
    /// </summary>
    private void SaveOriginalMaterials(GameObject building)
    {
        if (building == null) return;

        // 如果已经保存过，就不再保存
        if (originalMaterialsDict.ContainsKey(building)) return;

        Renderer[] renderers = building.GetComponentsInChildren<Renderer>();
        List<Material> materials = new List<Material>();

        foreach (Renderer renderer in renderers)
        {
            // 保存每个渲染器的原始材质
            materials.Add(renderer.material);
        }

        originalMaterialsDict[building] = materials.ToArray();
        Debug.Log($"[材质管理] 保存了 {building.name} 的 {materials.Count} 个原始材质");
    }

    /// <summary>
    /// 获取拆除目标建筑 - 参考官方GetTargetBuildingPart
    /// </summary>
    private GameObject GetTargetBuilding()
    {
        Ray ray = playerCamera.ScreenPointToRay(Input.mousePosition);

        // **排除第7层（Player层）**
        LayerMask raycastMask = buildingLayerMask & ~(1 << 7);

        if (Physics.Raycast(ray, out RaycastHit hit, raycastDistance, raycastMask))
        {
            // 优先检查Building组件
            Building building = hit.collider.GetComponentInParent<Building>();
            //Debug.Log(building != null ? $"检测到建筑组件: {building.name}" : "未检测到建筑组件");
            if (building != null)
            {
                return building.gameObject;
            }

            // 如果没有Building组件，检查是否是建筑物
            GameObject hitObject = hit.collider.gameObject;
            if (IsBuildingObject(hitObject))
            {
                return hitObject;
            }
        }

        return null;
    }

    /// <summary>
    /// 判断是否是建筑物对象
    /// </summary>
    private bool IsBuildingObject(GameObject obj)
    {
        // 根据名称判断（可以根据你的命名规则调整）
        string objName = obj.name.ToLower();
        return !objName.Contains("preview") &&
               !objName.Contains("ground") &&
               !objName.Contains("terrain") &&
               obj.GetComponent<Building>() != null;
    }

    /// <summary>
    /// 检查拆除条件 - 参考官方CheckDestroyCondition
    /// </summary>
    private bool CheckDestroyCondition()
    {
        if (currentDestroyTarget == null) return false;

        // 距离检查（这个不用，因为射线能射到就能拆就行）
        /*
        Vector3 casterPosition = GetCaster.position;
        float distance = Vector3.Distance(casterPosition, currentDestroyTarget.transform.position);
        if (distance > raycastDistance)
        {
            return false;
        }
        */

        // 检查建筑是否允许拆除
        Building building = currentDestroyTarget.GetComponent<Building>();
        if (building != null)
        {
            // 可以在Building类中添加CanDestroy属性来控制
            // return building.CanDestroy;
        }

        return true;  // 默认允许拆除
    }

    /// <summary>
    /// 设置拆除高亮效果
    /// </summary>
    private void SetDestroyHighlight(GameObject building)
    {
        if (building == null) return;

        Color highlightColor = canDestroy ? destroyHighlightColor : cannotPlaceColor;
        ChangeBuildingMaterial(building, highlightColor);
    }

    /// <summary>
    /// 恢复建筑外观
    /// </summary>
    private void RestoreBuildingAppearance(GameObject building)
    {
        if (building == null)
        {
            Debug.Log("[材质管理] 建筑对象为null");
            return;
        }

        Debug.Log($"[材质管理] 开始恢复建筑外观: {building.name}");

        // **方法1：从字典恢复原始材质**
        if (originalMaterialsDict.ContainsKey(building))
        {
            Renderer[] renderers = building.GetComponentsInChildren<Renderer>();
            Material[] savedMaterials = originalMaterialsDict[building];

            for (int i = 0; i < renderers.Length && i < savedMaterials.Length; i++)
            {
                renderers[i].material = savedMaterials[i];
            }

            Debug.Log($"[材质管理] 成功恢复 {building.name} 的原始材质");
            return;
        }

        // **方法2：从预制体重新获取材质**
        Debug.Log($"[材质管理] 未找到原始材质，尝试从预制体恢复");
        string buildingName = building.name.Replace("(Clone)", "").Trim();

        // 查找对应的预制体
        GameObject prefab = System.Array.Find(buildingPrefabs, p => p.name == buildingName);
        if (prefab != null)
        {
            Renderer[] buildingRenderers = building.GetComponentsInChildren<Renderer>();
            Renderer[] prefabRenderers = prefab.GetComponentsInChildren<Renderer>();

            for (int i = 0; i < buildingRenderers.Length && i < prefabRenderers.Length; i++)
            {
                buildingRenderers[i].material = prefabRenderers[i].material;
            }

            Debug.Log($"[材质管理] 从预制体恢复了 {building.name} 的材质");
            return;
        }

        // **方法3：重置为白色**
        Debug.Log($"[材质管理] 最后兜底，重置为白色");
        Renderer[] allRenderers = building.GetComponentsInChildren<Renderer>();
        foreach (Renderer renderer in allRenderers)
        {
            if (renderer.material.name.Contains("Instance"))
            {
                renderer.material.color = Color.white;
            }
        }
    }

    /// <summary>
    /// 改变建筑材质
    /// </summary>
    private void ChangeBuildingMaterial(GameObject building, Color color)
    {
        if (building == null) return;

        Renderer[] renderers = building.GetComponentsInChildren<Renderer>();
        foreach (Renderer renderer in renderers)
        {
            Material tempMaterial = new Material(previewMaterial);
            tempMaterial.color = color;
            renderer.material = tempMaterial;
        }
    }

    #endregion

    #region 输入处理

    
    private void HandleInput()
    {
        HandleModeInput();
        //HandleBuildingSelection();
        HandleActionInput();
    }

    private void HandleModeInput()
    {/*
        
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            SetBuildMode(BuildMode.NONE);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            SetBuildMode(BuildMode.PLACE);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha3))
        {
            SetBuildMode(BuildMode.DESTROY);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha4))
        {
            SetBuildMode(BuildMode.EDIT);
        }
    */
        //按Q开启或关闭摧毁模式
        if (Input.GetKeyDown(KeyCode.Q))
        {
            if (CurrentBuildMode != BuildMode.DESTROY)
            {
                SetBuildMode(BuildMode.DESTROY);
            }
            else
            {
                SetBuildMode(BuildMode.NONE);
            }
        }

        //按ESC切换回NONE模式
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            SetBuildMode(BuildMode.NONE);
        }
        
        /*
    // Tab键切换吸附模式
    if (Input.GetKeyDown(KeyCode.Tab))
    {
        ToggleSnapMode();
    }
    */
    }

        

    private void HandleBuildingSelection()
    {
        if (buildingPrefabs != null && buildingPrefabs.Length > 0)
        {
            float scroll = Input.GetAxis("Mouse ScrollWheel");
            if (scroll > 0)
            {
                SelectNextBuilding();
            }
            else if (scroll < 0)
            {
                SelectPreviousBuilding();
            }
        }
    }

    

    private void HandleActionInput()
    {
        if (Input.GetMouseButtonDown(0))
        {
            PerformAction();
        }

        if (Input.GetMouseButtonDown(1))
        {
            CancelAction();
        }
    }
    
    public static void SelectBuildingByIndex(int index)
    {
        OnBuildingSelected?.Invoke(index);
    }
    void OnEnable()
    {
        OnBuildingSelected += HandleBuildingSelected;
    }
    void OnDisable()
    {
        OnBuildingSelected -= HandleBuildingSelected;
    }
    private void HandleBuildingSelected(int index)
    {
        selectedBuildingIndex = index;
        SetBuildMode(BuildMode.PLACE);
        RefreshPreview();
        Debug.Log($"通过UI选择建筑：{buildingPrefabs[selectedBuildingIndex].name}");
    }
    

    /// <summary>
    /// 切换吸附检测模式
    /// </summary>
    [ContextMenu("切换吸附模式")]
    private void ToggleSnapMode()
    {
        snapMode = (snapMode == SnapDetectionMode.Raycast) ? SnapDetectionMode.Overlap : SnapDetectionMode.Raycast;
        Debug.Log($"切换到 {snapMode} 模式");
    }

    public void SetBuildMode(BuildMode newMode)
    {
        BuildMode oldMode = CurrentBuildMode;
        CurrentBuildMode = newMode;

        Debug.Log($"建造模式从 {oldMode} 切换到 {newMode}");

        // 清理不同模式的状态
        if (oldMode == BuildMode.PLACE)
        {
            DestroyPreview();
            ResetConveyorState(); // **新增：清理传送带状态**
        }
        else if (oldMode == BuildMode.DESTROY)
        {
            if (currentDestroyTarget != null)
            {
                RestoreBuildingAppearance(currentDestroyTarget);
            }

            currentDestroyTarget = null;
            canDestroy = false;
        }
    }

    private void SelectNextBuilding()
    {
        selectedBuildingIndex = (selectedBuildingIndex + 1) % buildingPrefabs.Length;
        RefreshPreview();
        Debug.Log($"选择建筑：{buildingPrefabs[selectedBuildingIndex].name}");
    }

    private void SelectPreviousBuilding()
    {
        selectedBuildingIndex = (selectedBuildingIndex - 1 + buildingPrefabs.Length) % buildingPrefabs.Length;
        RefreshPreview();
        Debug.Log($"选择建筑：{buildingPrefabs[selectedBuildingIndex].name}");
    }

    private void RefreshPreview()
    {
        if (CurrentBuildMode == BuildMode.PLACE)
        {
            DestroyPreview();
        }
    }
    #endregion

    #region 操作执行（建筑放置与拆除的决定）
    private void PerformAction()
    {
        switch (CurrentBuildMode)
        {
            case BuildMode.PLACE:
                TryPlaceBuilding();
                break;
            case BuildMode.DESTROY:
                TryDestroyBuilding();
                break;
            case BuildMode.EDIT:
                TryEditBuilding();
                break;
        }
    }

    private void TryPlaceBuilding()
    {
        // **传送带特殊处理**
        if (IsCurrentBuildingConveyor())
        {
            HandleConveyorPlacement();
            return;
        }

        // 原有的普通建筑放置逻辑保持不变...
        if (currentPreview == null || !canPlace)
        {
            Debug.Log("无法放置建筑！");
            return;
        }

        Vector3 buildingPosition = currentPreview.transform.position;
        Quaternion buildingRotation = currentPreview.transform.rotation;
        Vector3 buildingScale = currentPreview.transform.localScale;

        GameObject newBuilding = Instantiate(
            buildingPrefabs[selectedBuildingIndex],
            buildingPosition,
            buildingRotation
        );

        newBuilding.transform.localScale = buildingScale;
        SetupPlacedBuilding(newBuilding);

        if (isSnappingToConnector && currentTargetConnector != null && currentSnapPoint != null)
        {
            Building buildingComponent = newBuilding.GetComponent<Building>();
            if (buildingComponent != null)
            {
                bool connected = currentTargetConnector.SnapBuildingToPoint(buildingComponent, currentSnapPoint);
                if (connected)
                {
                    Debug.Log($"建筑 {newBuilding.name} 已连接到连接器 {currentTargetConnector.name}");
                }
            }
        }

        Debug.Log($"成功放置建筑：{newBuilding.name}");
        DestroyPreview();
    }

    /// <summary>
    /// 处理传送带放置
    /// </summary>
    private void HandleConveyorPlacement()
    {
        if (conveyorState == ConveyorPlaceState.Normal || conveyorState == ConveyorPlaceState.WaitingStart)
        {
            // 第一次点击：设置起点
            if (currentPreview != null && canPlace)
            {
                // 保存起点信息
                conveyorStartPosition = currentPreview.transform.position;
                conveyorStartRotation = currentPreview.transform.rotation;

                // 保存起点吸附信息
                conveyorStartSnapped = isSnappingToConnector;
                conveyorStartConnector = currentTargetConnector;
                conveyorStartSnapPoint = currentSnapPoint;

                conveyorState = ConveyorPlaceState.WaitingEnd;

                string snapInfo = conveyorStartSnapped ? $" (Start吸附到 {conveyorStartConnector.name})" : "";
                Debug.Log($"传送带起点已设置: {conveyorStartPosition}{snapInfo}");
            }
            else
            {
                Debug.Log("无法设置传送带起点！");
            }
        }
        else if (conveyorState == ConveyorPlaceState.WaitingEnd)
        {
            // 第二次点击：完成放置
            if (canPlace)
            {
                // 获取终点信息
                Transform endConnector = GetConveyorEndConnector(currentPreview);
                Vector3 endPosition = endConnector != null ? endConnector.position : currentPreview.transform.position;
                Quaternion endRotation = endConnector != null ? endConnector.rotation : currentPreview.transform.rotation;

                bool endSnapped = isSnappingToConnector && currentTargetConnector != null && currentSnapPoint != null;

                // 创建最终的传送带
                GameObject newConveyor = Instantiate(buildingPrefabs[selectedBuildingIndex]);
                SetConveyorShape(newConveyor, conveyorStartPosition, conveyorStartRotation, endPosition, endRotation);
                SetupPlacedBuilding(newConveyor);

                //创建吸附




                //构建mesh和创建meshcollider
                SplineMesh splineMesh = newConveyor.GetComponentInChildren<SplineMesh>();
                if (splineMesh != null)
                {
                    splineMesh.GetVerts();
                    splineMesh.BuildMesh();
                }

                MeshCollider meshCollider = newConveyor.GetComponentInChildren<MeshCollider>();
                if (meshCollider != null)
                {
                    meshCollider.sharedMesh = splineMesh.GetComponent<MeshFilter>().mesh;
                }

                // 处理起点连接
                if (conveyorStartSnapped && conveyorStartConnector != null && conveyorStartSnapPoint != null)
                {
                    // 这里可能需要特殊处理Start连接器的连接逻辑
                    Debug.Log($"传送带Start连接器连接到: {conveyorStartConnector.name}");
                }

                // 处理终点连接,这里有个问题就是终点连接到容器后，需要把传送带的End连接器禁用掉
                if (endSnapped)
                {
                    // 这里可能需要特殊处理End连接器的连接逻辑
                    Debug.Log($"传送带End连接器连接到: {currentTargetConnector.name}");
                }

                // 构建容器连接
                //如果起点有连接
                GameObject containerBuilding1 = null;
                if (conveyorStartConnector != null)
                {
                    containerBuilding1 = conveyorStartConnector.GetComponentInParent<Building>()?.gameObject;
                }
                //如果终点有连接
                GameObject containerBuilding2 = null;
                if (currentTargetConnector != null)
                {
                    containerBuilding2 = currentTargetConnector.GetComponentInParent<Building>()?.gameObject;
                }
                //如果起点连接的是容器或者传送带
                if (containerBuilding1 != null && (containerBuilding1.GetComponent<Building>().Type == BuildingType.Container || containerBuilding1.GetComponent<Building>().Type == BuildingType.Conveyor))
                {
                    //连接起点
                    containerBuilding1.GetComponentInChildren<Container>().AddOutputBuilding(newConveyor);
                    newConveyor.GetComponentInChildren<Container>().AddInputBuilding(containerBuilding1);
                }
                else
                {
                    Debug.Log("起点连接器未连接到容器");
                }
                //如果终点连接的是容器或者传送带
                if (containerBuilding2 != null && (containerBuilding2.GetComponent<Building>().Type == BuildingType.Container|| containerBuilding2.GetComponent<Building>().Type == BuildingType.Conveyor))
                {
                    //连接终点
                    containerBuilding2.GetComponentInChildren<Container>().AddInputBuilding(newConveyor);
                    newConveyor.GetComponentInChildren<Container>().AddOutputBuilding(containerBuilding2);
                }
                else
                {
                    Debug.Log("终点连接器未连接到容器");
                }
                

                float distance = Vector3.Distance(conveyorStartPosition, endPosition);
                Debug.Log($"成功放置传送带：长度 {distance:F1}m");

                // 重置状态
                ResetConveyorState();
                DestroyPreview();
            }
            else
            {
                Debug.Log("无法设置传送带终点！");
            }
        }
    }

    private void SetupPlacedBuilding(GameObject building)
    {
        Collider[] colliders = building.GetComponentsInChildren<Collider>();
        foreach (Collider col in colliders)
        {
            col.enabled = true;
        }

        if (building.GetComponent<Building>() == null)
        {
            Building buildingComponent = building.AddComponent<Building>();

            string prefabName = buildingPrefabs[selectedBuildingIndex].name.ToLower();
            if (prefabName.Contains("wall"))
            {
                buildingComponent.Type = BuildingType.Wall;
            }
            else if (prefabName.Contains("floor"))
            {
                buildingComponent.Type = BuildingType.Floor;
            }
            else if (prefabName.Contains("foundation"))
            {
                buildingComponent.Type = BuildingType.Foundation;
            }
            else if (prefabName.Contains("container"))
            {
                buildingComponent.Type = BuildingType.Container;
            }
            else if (prefabName.Contains("conveyor"))
            {
                buildingComponent.Type = BuildingType.Conveyor;
            }
            else
            {
                buildingComponent.Type = BuildingType.Foundation;
            }
        }
    }

    private void TryDestroyBuilding()
    {
        if (currentDestroyTarget == null || !canDestroy)
        {
            Debug.Log("无法拆除建筑！");
            return;
        }

        Building building = currentDestroyTarget.GetComponent<Building>();

        Debug.Log($"拆除建筑：{currentDestroyTarget.name}");

        // **新增：清理材质记录**
        if (originalMaterialsDict.ContainsKey(currentDestroyTarget))
        {
            originalMaterialsDict.Remove(currentDestroyTarget);
            Debug.Log($"[材质管理] 清理了 {currentDestroyTarget.name} 的材质记录");
        }

        // 执行拆除
        Destroy(currentDestroyTarget);

        // 清理状态
        currentDestroyTarget = null;
        canDestroy = false;
    }

    private void TryEditBuilding()
    {
        Debug.Log("编辑功能暂未实现");
    }

    private void CancelAction()
    {
        // **传送带取消处理**
        if (IsCurrentBuildingConveyor() && conveyorState == ConveyorPlaceState.WaitingEnd)
        {
            // 回到起点选择阶段
            conveyorState = ConveyorPlaceState.WaitingStart;
            Debug.Log("取消传送带终点选择，请重新选择起点");
            return;
        }

        // 完全退出
        ResetConveyorState();
        SetBuildMode(BuildMode.NONE);
    }

    #endregion

    #region 可视化调试
    
    


    #endregion
}