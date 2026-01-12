using UnityEngine;

public class UI : MonoBehaviour
{
    //汇总UI相关脚本，处理一些全局UI逻辑
    public GameObject buildUI; // 建筑UI Canvas
    public BuildingPlacer buildingPlacer; // 在Inspector里拖入你的BuildingPlacer对象


    void Update()
    {
        // Tab键切换建筑UI激活状态
        if (Input.GetKeyDown(KeyCode.Tab))
        {
            if (buildUI != null)
            {
                bool toActive = !buildUI.activeSelf;
                buildUI.SetActive(toActive);

                // 打开UI时解锁鼠标，关闭时锁定鼠标
                if (toActive)
                {
                    Cursor.lockState = CursorLockMode.None;
                    Cursor.visible = true;
                    buildingPlacer.SetBuildMode(BuildingPlacer.BuildMode.NONE);
                }
                else
                {
                    Cursor.lockState = CursorLockMode.Locked;
                    Cursor.visible = false;
                }
            }
        }

        // Esc键关闭建筑UI
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            if (buildUI != null)
            {
                buildUI.SetActive(false);
                Cursor.lockState = CursorLockMode.Locked;
                Cursor.visible = false;
            }
        }
    }
}