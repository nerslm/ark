using System;
using System.Collections.Generic;
using UnityEngine;


public class InventoryController : MonoBehaviour
{
    public ItemGrid selectedItemGrid;
    public ItemGrid selectedGrid
    {
        get => selectedItemGrid;
        set
        {
            selectedItemGrid = value;
            highlighter.SetParent(value);
        }
    }

    InventoryItem selectedItem;
    InventoryItem overlapItem;
    RectTransform rectTransform;

    [SerializeField] List<ItemData> items;
    [SerializeField] GameObject itemPrefab;
    [SerializeField] Transform canvasTransform;

    Highlighter highlighter;

    private void Awake()
    {
        highlighter = FindObjectOfType<Highlighter>();
    }

    private void Update()
    {
        if (selectedItem != null)
        {
            rectTransform.position = Input.mousePosition;
        }



        if (Input.GetKeyDown(KeyCode.Q))
        {
            CreateRandomItem();
        }



        if (selectedItemGrid == null)
        {
            highlighter.Show(false);
            //Debug.Log("no grid selected");
            return;
        }

        HandleHighlight();

        if (Input.GetMouseButtonDown(0))
        {
            Vector2Int tileGridPosition = GetTargetGridPosition();

            if (selectedItem == null)
            {
                selectedItem = selectedItemGrid.PickupItem(tileGridPosition.x, tileGridPosition.y);
                if (selectedItem != null)
                {
                    rectTransform = selectedItem.GetComponent<RectTransform>();
                }
            }
            else
            {
                bool complete = selectedItemGrid.PlaceItem(selectedItem, tileGridPosition.x, tileGridPosition.y, ref overlapItem);
                if (complete)
                {
                    selectedItem = null;
                    if (overlapItem != null)
                    {

                        selectedItem = overlapItem;
                        overlapItem = null;
                        rectTransform = selectedItem.GetComponent<RectTransform>();
                    }
                }
            }

            Debug.Log(selectedItemGrid.GetTileGridPosition(Input.mousePosition));
        }

    }

    private Vector2Int GetTargetGridPosition()
    {
        Vector2 position = Input.mousePosition;

        // 如果手里抓着东西，应用偏移量
        if (selectedItem != null)
        {
            position.x -= (selectedItem.itemData.width - 1) * ItemGrid.tileSizeWidth / 2;
            position.y += (selectedItem.itemData.height - 1) * ItemGrid.tileSizeHeight / 2;
        }

        return selectedItemGrid.GetTileGridPosition(position);
    }

    InventoryItem itemToHighlight;
    Vector2Int oldPosition;

    private void HandleHighlight()
    {
        Vector2Int positionOnGrid = GetTargetGridPosition();

        // 优化：如果是普通网格，才检查旧位置优化；装备栏不需要这个优化（因为它只有一个位置）
        if (selectedItemGrid.isEquipmentSlot == false)
        {
            if (positionOnGrid == oldPosition) { return; }
            oldPosition = positionOnGrid;
        }

        // --- 分支逻辑 ---

        // 情况 A：如果是装备栏
        if (selectedItemGrid.isEquipmentSlot)
        {
            // 获取装备栏里的物品（装备栏固定在 0,0）
            InventoryItem itemInSlot = selectedItemGrid.GetItem(0, 0);

            // 逻辑：如果手里拿着东西 OR 装备栏里有东西，都显示高亮
            if (selectedItem != null || itemInSlot != null)
            {
                highlighter.Show(true);

                // 装备栏高亮通常是高亮整个框，而不是里面的物体
                RectTransform slotRect = selectedItemGrid.GetComponent<RectTransform>();
                highlighter.SetSize(slotRect.rect.size);
                highlighter.SetPositionToCenter(selectedItemGrid);
            }
            else
            {
                // 手里没东西，装备栏也是空的 -> 隐藏
                highlighter.Show(false);
            }
        }
        // 情况 B：如果是普通网格 (逻辑保持不变)
        else
        {
            if (selectedItem == null)
            {
                // --- 修复开始 ---
                // 检查鼠标位置是否在网格范围内 (宽1高1代表只查单格)
                bool isValidPosition = selectedItemGrid.BoundryCheck(positionOnGrid.x, positionOnGrid.y, 1, 1);

                if (!isValidPosition)
                {
                    highlighter.Show(false);
                    return; // 如果越界，直接跳出，不执行 GetItem
                }
                // --- 修复结束 ---
                // 手里没东西：高亮鼠标指向的网格里的物品（提示可捡起）
                itemToHighlight = selectedItemGrid.GetItem(positionOnGrid.x, positionOnGrid.y);
                if (itemToHighlight != null)
                {
                    highlighter.Show(true);
                    highlighter.SetSize(itemToHighlight);
                    highlighter.SetPosition(selectedItemGrid, itemToHighlight);
                }
                else
                {
                    highlighter.Show(false);
                }
            }
            else
            {
                // 手里有东西：高亮物品将要放置的位置（提示占用区域）
                highlighter.Show(selectedItemGrid.BoundryCheck(positionOnGrid.x, positionOnGrid.y, selectedItem.itemData.width, selectedItem.itemData.height));

                highlighter.SetSize(selectedItem);
                highlighter.SetPosition(selectedItemGrid, selectedItem, positionOnGrid.x, positionOnGrid.y);
            }
        }
    }

    private void CreateRandomItem()
    {
        InventoryItem inventoryItem = Instantiate(itemPrefab).GetComponent<InventoryItem>();
        selectedItem = inventoryItem;

        rectTransform = inventoryItem.GetComponent<RectTransform>();
        rectTransform.SetParent(canvasTransform);

        int selectedItemID = UnityEngine.Random.Range(0, items.Count);
        inventoryItem.Set(items[selectedItemID]);
    }
}
