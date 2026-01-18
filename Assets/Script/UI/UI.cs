using UnityEngine;

public class UI : MonoBehaviour
{
    [Header("UI 面板引用")]
    public GameObject buildUI;      // 建筑面板
    public GameObject bagUI;        // 背包面板 (新加的)

    [Header("脚本引用")]
    public BuildingPlacer buildingPlacer;

    void Start()
    {
        // 初始化：确保所有面板开始时是关闭的
        if (buildUI != null) buildUI.SetActive(false);
        if (bagUI != null) bagUI.SetActive(false);

        // 初始化鼠标状态
        UpdateCursorAndGameState();
    }

    void Update()
    {
        // TAB 键控制建筑面板
        if (Input.GetKeyDown(KeyCode.Tab))
        {
            TogglePanel(buildUI);
        }

        // C 键控制背包面板
        if (Input.GetKeyDown(KeyCode.C))
        {
            TogglePanel(bagUI);
        }

        // ESC 键关闭所有面板
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            CloseAllPanels();
        }
    }

    // 通用的切换面板方法
    void TogglePanel(GameObject panelToToggle)
    {
        if (panelToToggle == null) return;

        bool isActive = panelToToggle.activeSelf;

        if (isActive)
        {
            // 如果本来是开着的，就关闭它
            panelToToggle.SetActive(false);
        }
        else
        {
            // 如果本来是关着的，先关闭所有其他面板（互斥逻辑），再打开它
            CloseAllPanels();
            panelToToggle.SetActive(true);
        }

        // 每次开关面板后，刷新鼠标和游戏状态
        UpdateCursorAndGameState();
    }

    // 关闭所有面板
    void CloseAllPanels()
    {
        if (buildUI != null) buildUI.SetActive(false);
        if (bagUI != null) bagUI.SetActive(false);

        UpdateCursorAndGameState();
    }

    // 统一管理鼠标锁定和游戏逻辑状态
    void UpdateCursorAndGameState()
    {
        // 检查是否有任何一个 UI 是开启的
        bool isAnyUIPanelOpen = (buildUI != null && buildUI.activeSelf) ||
                                (bagUI != null && bagUI.activeSelf);

        if (isAnyUIPanelOpen)
        {
            // --- UI 模式 ---
            // 解锁鼠标，显示鼠标
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;

            // 你的特殊逻辑：打开 UI 时关闭建造模式
            if (buildingPlacer != null)
            {
                buildingPlacer.SetBuildMode(BuildingPlacer.BuildMode.NONE);
            }
        }
        else
        {
            // --- 游戏模式 ---
            // 锁定鼠标，隐藏鼠标
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
        }
    }
}