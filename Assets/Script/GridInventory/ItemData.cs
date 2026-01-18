using UnityEngine;

[CreateAssetMenu(fileName = "ItemData", menuName = "Scriptable Objects/ItemData")]

public class ItemData : ScriptableObject
{
    public int width = 1;
    public int height = 1;

    public Sprite itemIcon;

    public int maxamount = 1;

    public ItemType itemType;
}

public enum ItemType
{
    General,    // 普通物品（杂物、消耗品等，任何格子都能放）
    Weapon,     // 武器
    Head,       // 头盔
    Chest,      // 胸甲
    Feet        // 鞋子
}