using UnityEngine;

[CreateAssetMenu(fileName = "ItemData", menuName = "Scriptable Objects/ItemData")]

public class ItemData : ScriptableObject
{
    public int width = 1;
    public int height = 1;

    public Sprite itemIcon;

    public int maxamount = 1;

    public ItemType itemType;

    [Header("Attributes / Buffs")]
    // 比如：移动速度加成 (0 = 没加成, 2 = 加2点速度)
    public float moveSpeedBonus;

    [Header("特殊效果")]
    public bool isMagneticBoots = false; // 磁力鞋
}

public enum ItemType
{
    General,    // 普通物品（杂物、消耗品等，任何格子都能放）
    Weapon,     // 武器
    Head,       // 头盔
    Chest,      // 胸甲
    Feet        // 鞋子
}