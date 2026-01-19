using UnityEngine;

public class SkyCameraSync : MonoBehaviour
{
    [Header("必须拖拽：玩家的主摄像机")]
    public Camera mainPlayerCamera;

    [Header("可选设置")]
    [Tooltip("缩放系数，保持默认1即可，除非你的星空模型特别小")]
    public float scaleFactor = 1f;

    // 记录初始位置，确保它永远不动
    private Vector3 initialPosition;

    void Start()
    {
        // 记录星空相机的出生点（通常是 0,0,0 或者很远的地方）
        initialPosition = transform.position;

        // 如果没拖拽，尝试自动寻找 Tag 为 MainCamera 的物体
        if (mainPlayerCamera == null)
        {
            mainPlayerCamera = Camera.main;
            if (mainPlayerCamera == null)
            {
                Debug.LogError("星空同步脚本：找不到主摄像机！请手动拖拽赋值！");
            }
        }
    }

    void LateUpdate()
    {
        if (mainPlayerCamera == null) return;

        // 核心逻辑：
        // 1. 位置锁死：永远保持在初始位置，这样玩家移动时，星星不会跟着跑（产生无限远的错觉）
        transform.position = initialPosition;

        // 2. 旋转同步：玩家看向哪，星空相机就看向哪
        // 使用 rotation 属性，完美复制四元数，不需要关心欧拉角
        transform.rotation = mainPlayerCamera.transform.rotation;

        // 3. (可选) 视野同步：如果玩家摄像机有缩放(FOV变化)，星空也要跟着变
        if (GetComponent<Camera>() != null)
        {
            GetComponent<Camera>().fieldOfView = mainPlayerCamera.fieldOfView;
        }
    }
}