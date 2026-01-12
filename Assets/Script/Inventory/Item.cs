using UnityEngine;

[CreateAssetMenu(fileName = "New Item", menuName = "Inventory/New Item")]
public class Item : ScriptableObject//这里给的是物品的一些特性，不包含一些游戏内变量，例如数量，到时候保存的列表中的这个东西只会存引用而非所有特性
{
    public string itemName;
    public Sprite itemIcon;
    public int maxStack = 10;//最大堆叠数量
    [TextArea]
    public string itemDescription;

    public GameObject itemPrefab;//物品的预制体


}
