using TMPro;
using UnityEngine;
using UnityEngine.UI;

[System.Serializable]//使其可以被序列化从而存储在Inventory中
public class ItemSlotInfo
{
    public Item slotItem;//用于得知当前格子中的物品以及他的特性
    public int amount; //物品的数量
    public string name;//物品的名称，用于UI显示，就是监视器改名

    public bool isLockedType =   false;//是否是锁定槽类型,玩家只能往里放对应的物品，不能将槽拿出至null(但可归0)也不能放别的东西进来

    // 加上这个构造函数，要用带参数的方式创建 ItemSlotInfo 对象就必须这么写，不然就只能new ItemSlotInfo()
    public ItemSlotInfo(Item slotItem, int amount, bool isLockedType = false)//默认不锁定
    {
        this.slotItem = slotItem;
        this.amount = amount;
        this.isLockedType = isLockedType;
    }

}
