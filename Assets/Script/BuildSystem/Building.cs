using UnityEngine;
using System;
using System.Security;

public class Building : MonoBehaviour
{
    #region 建筑属性设置
    [SerializeField] string BuildingName; // 建筑名称
    [SerializeField] public BuildingType Type; // 建筑类型
    [SerializeField] Texture2D Thumbnail; // 缩略图
    [SerializeField] string Identifier; // 唯一标识符 (GUID)

    [SerializeField] public float ClampHeight = 0f; // 高度限制，默认为0，表示建筑必须放置在地面上，地基由于有厚度可以拉升
    #endregion

    //实例化时赋予唯一标识符
    void Awake()//实例化时调用，或者在游戏开始时是实例可调用
    {
        if (Identifier == string.Empty)
        {
            Identifier = Guid.NewGuid().ToString("N");
        }
    }



}


//枚举建筑类型
public enum BuildingType
{
    Foundation,
    Wall,
    Floor,
    Container,
    Conveyor,
    Decorator,
}


