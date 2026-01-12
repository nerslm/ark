using UnityEngine;
using UnityEngine.UI;

public class BuildUI : MonoBehaviour
{
    public GameObject uiPanel; // 你的建筑选择UI面板（一般就是自己）
    public Button[] buildingButtons; // 所有建筑按钮（BuildingSlot上的Button组件）

    void OnValidate()
    {
        // 自动查找所有子物体下的Button组件并赋值到数组
        buildingButtons = GetComponentsInChildren<Button>(true);

        // 自动为每个按钮绑定点击事件
        for (int i = 0; i < buildingButtons.Length; i++)
        {
            int index = i; // 闭包捕获
            buildingButtons[i].onClick.RemoveAllListeners(); // 防止重复绑定
            buildingButtons[i].onClick.AddListener(() => OnClickSelect(index));
        }

        UnityEditor.EditorUtility.SetDirty(this); // 标记为已修改，方便保存
    }

    public void OnClickSelect(int buildingIndex)
    {
        // 1. 通知建造系统切换建筑
        BuildingPlacer.SelectBuildingByIndex(buildingIndex);
        Debug.Log($"选择建筑索引：{buildingIndex}"); //

        // 2. 关闭UI
        if (uiPanel != null)
        {
            uiPanel.SetActive(false);
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
        }
        
    }

    // 你可以添加一个方法来打开UI

    


}
