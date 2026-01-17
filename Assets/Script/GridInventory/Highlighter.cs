using UnityEngine;

public class Highlighter : MonoBehaviour
{
    [SerializeField] RectTransform highlighter;

    public void Show(bool b)
    {
        highlighter.gameObject.SetActive(b);
    }

    // 原有的方法（用于网格）
    public void SetSize(InventoryItem targetItem)
    {
        Vector2 size = new Vector2();
        size.x = targetItem.itemData.width * ItemGrid.tileSizeWidth;
        size.y = targetItem.itemData.height * ItemGrid.tileSizeHeight;
        highlighter.sizeDelta = size;
    }

    // --- 新增方法：直接指定大小（用于装备栏） ---
    public void SetSize(Vector2 size)
    {
        highlighter.sizeDelta = size;
    }

    // 原有的方法（用于网格）
    public void SetPosition(ItemGrid targetGrid, InventoryItem targetItem)
    {
        highlighter.SetParent(targetGrid.GetComponent<RectTransform>());
        Vector2 pos = targetGrid.CalculatePositionOnGrid(targetItem, targetItem.onGridPositionX, targetItem.onGridPositionY);
        highlighter.localPosition = pos;
    }

    public void SetPosition(ItemGrid targetGrid, InventoryItem targetItem, int posX, int posY)
    {
        highlighter.SetParent(targetGrid.GetComponent<RectTransform>());
        Vector2 pos = targetGrid.CalculatePositionOnGrid(targetItem, posX, posY);
        highlighter.localPosition = pos;
    }

    public void SetParent(ItemGrid targetGrid)
    {
        if (targetGrid == null) { return; }
        // 将高亮框的父物体设置为目标网格的 RectTransform
        highlighter.SetParent(targetGrid.GetComponent<RectTransform>());
    }

    // --- 新增方法：强制居中（用于装备栏） ---
    public void SetPositionToCenter(ItemGrid targetGrid)
    {
        highlighter.SetParent(targetGrid.GetComponent<RectTransform>());
        highlighter.localPosition = Vector2.zero; // 直接归零居中
    }
}