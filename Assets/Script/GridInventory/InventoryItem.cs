using System;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class InventoryItem : MonoBehaviour
{
    public ItemData itemData;

    public int onGridPositionX;
    public int onGridPositionY;

    public int currentAmount = 1;

    [SerializeField] TextMeshProUGUI itemCountText;

    internal void Set(ItemData itemData)
    {
        this.itemData = itemData;

        GetComponent<Image>().sprite = itemData.itemIcon;

        Vector2 size = new Vector2();
        size.x = itemData.width * ItemGrid.tileSizeWidth;
        size.y = itemData.height * ItemGrid.tileSizeHeight;
        GetComponent<RectTransform>().sizeDelta = size;

        RefreshCount();
    }

    public void RefreshCount()
    {
        if (itemCountText == null) return;

        if (currentAmount > 1)
        {
            itemCountText.gameObject.SetActive(true);
            itemCountText.text = currentAmount.ToString();
        }
        else
        {
            itemCountText.gameObject.SetActive(false);
        }
    }

    // --- 新增功能：尝试将数量添加到当前物品堆叠中 ---
    // 返回值：无法堆叠的剩余数量 (例如：这里已有9个，最大10个，你塞进来5个。结果：这里变10个，返回4个)
    public int AddToStack(int amountToAdd)
    {
        // 算出还能塞多少
        int spaceRemaining = itemData.maxamount - currentAmount;

        // 如果能塞的数量比要加的数量多 (比如剩5个空位，加2个)，那就全加进去
        if (spaceRemaining >= amountToAdd)
        {
            currentAmount += amountToAdd;
            RefreshCount();
            return 0; // 全部堆叠成功，没有剩余
        }

        // 如果塞不下了 (比如剩1个空位，加5个)，填满并返回剩余的
        currentAmount = itemData.maxamount;
        RefreshCount();

        return amountToAdd - spaceRemaining; // 返回剩下的
    }
}