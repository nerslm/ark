using System.Collections.Generic;
using UnityEngine;
//可复用的库存类
//[CreateAssetMenu(fileName = "New Inventory", menuName = "Inventory/New Inventory")]
public class Inventory
//: ScriptableObject//Unity的一种存储方式，每个物体都可以有一个脚本化对象作为他的数据存储，这样就可以在不同物体间共享数据，但是每一个新的实例都需要一个新的脚本化对象才能有独立存储，也就是一种存档，虽然可以动态创建但是我觉得也很麻烦，还是用json吧还能跨平台
{
    public List<ItemSlotInfo> itemSlotList = new List<ItemSlotInfo>();

}

/*这是一种json存储的思路
[System.Serializable]
public class InventoryData
{
    public List<ItemSlotInfo> itemList = new List<ItemSlotInfo>();
}

// 保存
string json = JsonUtility.ToJson(inventoryData);
File.WriteAllText(path, json);

// 读取
string json = File.ReadAllText(path);
InventoryData inventoryData = JsonUtility.FromJson<InventoryData>(json);
*/
