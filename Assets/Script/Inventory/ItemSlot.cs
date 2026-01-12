using TMPro;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class ItemSlot : MonoBehaviour, IPointerEnterHandler, IPointerDownHandler, IPointerUpHandler, IDropHandler, IDragHandler
{
    public InventoryManager inventoryManager;
    private Mouse mouse;
    public ItemSlotInfo itemSlotInfo;//这个格子的信息
    public Image itemImage;//这个格子的图片
    public TMP_Text AmountText;//数量文本

    [HideInInspector]
    //容器交互准备
    public bool isContainerSlot;//这个格子是否是容器的格子
    [HideInInspector]
    public Container containerStorage;//这个格子属于哪个容器

    private bool click;

    public void OnPointerEnter(PointerEventData eventData)
    {
        eventData.pointerEnter = this.gameObject;//设置当前悬停的物体为自己
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        click = true;
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        if (click)
        {
            OnClick();
            click = false;
        }
    }

    public void OnDrop(PointerEventData eventData)
    {
        OnClick();
        click = false;
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (click)
        {
            OnClick();
            click = false;
        }
    }
    private void RefreshInventories()
    {
        // 刷新玩家背包和容器的UI
        inventoryManager.RefreshBagMenu();
        inventoryManager.RefreshContainerMenu();
    }

    public void PickupItem()//拾取物品
    {
        mouse.itemSlotInfo = itemSlotInfo;
        mouse.sourceItemSlot = this;
        if (Input.GetKey(KeyCode.LeftShift) && itemSlotInfo.amount > 1) mouse.splitSize = itemSlotInfo.amount / 2;
        else mouse.splitSize = itemSlotInfo.amount;

        mouse.SetUI();
    }

    public void FadeOut()//物品被拿走后，格子淡出
    {
        itemImage.CrossFadeAlpha(0.3f, 0.05f, true);
    }

    public void DropItem()
    {
        itemSlotInfo.slotItem = mouse.itemSlotInfo.slotItem;
        if (mouse.splitSize < mouse.itemSlotInfo.amount)
        {
            itemSlotInfo.amount = mouse.splitSize;
            mouse.itemSlotInfo.amount -= mouse.splitSize;
            mouse.EmptySlot();
        }
        else
        {
            itemSlotInfo.amount = mouse.itemSlotInfo.amount;
            if (!mouse.itemSlotInfo.isLockedType)
                inventoryManager.ClearSlot(mouse.itemSlotInfo);
            else
                mouse.itemSlotInfo.amount = 0;//锁定槽类型物品归0但不为null    
        }
    }

    public void SwapItem(ItemSlotInfo slot1, ItemSlotInfo slot2)//交换物品
    {
        ItemSlotInfo temp = new ItemSlotInfo(slot1.slotItem, slot1.amount);
        slot1.slotItem = slot2.slotItem;
        slot1.amount = slot2.amount;
        slot2.slotItem = temp.slotItem;
        slot2.amount = temp.amount;
    }

    public void StackItem(ItemSlotInfo source, ItemSlotInfo target, int amount)//堆叠物品
    {
        int slotAvailable = target.slotItem.maxStack - target.amount;
        if (slotAvailable == 0) return;//目标格子已满
        if (amount > slotAvailable)
        {
            source.amount -= slotAvailable;
            target.amount = target.slotItem.maxStack;
        }
        if (amount <= slotAvailable)
        {
            target.amount += amount;
            if (source.amount == amount) inventoryManager.ClearSlot(source);
            else source.amount -= amount;
            
        }
    }

    public void OnClick()//点击格子时调用
    {
        if (inventoryManager != null)
        {
            mouse = inventoryManager.mouse;//?为啥不直接用mouse?
            bool isLockedType = itemSlotInfo.isLockedType;
            if (mouse.itemSlotInfo.slotItem == null)
            {
                if (itemSlotInfo.slotItem != null && itemSlotInfo.amount > 0)//格子里有物品，鼠标上没有物品
                {
                    PickupItem();
                    FadeOut();
                }
            }
            else
            {
                //放到完全一样的槽，就当什么也没发生
                if (itemSlotInfo == mouse.itemSlotInfo)
                {
                    RefreshInventories();
                }
                //放到空槽
                else if (itemSlotInfo.slotItem == null)//这里做到放置后拿出来的格子不为null
                {
                    DropItem();
                    RefreshInventories();
                }
                //放到不同物品的槽交换物品
                else if (itemSlotInfo.slotItem.itemName != mouse.itemSlotInfo.slotItem.itemName)
                {
                    if(!isLockedType&& !mouse.itemSlotInfo.isLockedType)//锁定槽类型不能放不同的物品进来
                        SwapItem(itemSlotInfo, mouse.itemSlotInfo);
                    RefreshInventories();
                }
                //放到相同类型的槽上则堆叠物品
                else if (itemSlotInfo.amount < itemSlotInfo.slotItem.maxStack)//堆叠数量未满
                {
                    StackItem(mouse.itemSlotInfo, itemSlotInfo, mouse.splitSize);
                    RefreshInventories();
                }


            }
        }
    }
}
