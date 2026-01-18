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
    // Removed: InventoryItem overlapItem; // 不再需要，删除了交换功能
    RectTransform rectTransform;

    [SerializeField] List<ItemData> items;
    [SerializeField] GameObject itemPrefab;
    [SerializeField] Transform canvasTransform;

    Highlighter highlighter;

    ItemGrid lastPickupGrid;
    Vector2Int lastPickupOriginPosition;

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
            if (selectedItem == null) CreateRandomItem();
        }

        HandleScroll();

        if (selectedItemGrid == null)
        {
            highlighter.Show(false);
            return;
        }

        HandleHighlight();

        if (Input.GetMouseButtonDown(0))
        {
            Vector2Int tileGridPosition = GetTargetGridPosition();

            // --- 捡起逻辑 ---
            if (selectedItem == null)
            {
                PickUpItem(tileGridPosition);
            }
            // --- 放置逻辑 (已删除交换) ---
            else
            {
                // 1. 检查装备类型是否匹配
                if (selectedItemGrid.CanPlaceItem(selectedItem) == false)
                {
                    Debug.Log("类型不匹配");
                    return;
                }

                // 2. 检查目标区域是否有物体 (解决大物体锚点偏差问题)
                InventoryItem itemOnGrid = selectedItemGrid.GetItemInArea(
                    tileGridPosition.x,
                    tileGridPosition.y,
                    selectedItem.itemData.width,
                    selectedItem.itemData.height
                );

                if (itemOnGrid != null)
                {
                    // 区域内有物体 -> 只能堆叠，不能交换
                    if (itemOnGrid.itemData == selectedItem.itemData)
                    {
                        int remaining = itemOnGrid.AddToStack(selectedItem.currentAmount);
                        selectedItem.currentAmount = remaining;

                        if (selectedItem.currentAmount == 0)
                        {
                            Destroy(selectedItem.gameObject);
                            selectedItem = null;
                            lastPickupGrid = null;
                        }
                        else
                        {
                            selectedItem.RefreshCount();
                        }
                    }
                    else
                    {
                        // 区域有物体，且无法堆叠 -> 什么都不做 (禁止交换)
                        return;
                    }
                }
                else
                {
                    // 区域完全为空 -> 直接放置
                    PlaceItem(tileGridPosition);
                }
            }
        }
    }

    private void PlaceItem(Vector2Int tileGridPosition)
    {
        // 这里的 PlaceItem 现在非常纯粹，只负责放，如果 Grid 判定不能放(比如有隐藏冲突)，返回 false
        bool complete = selectedItemGrid.PlaceItem(selectedItem, tileGridPosition.x, tileGridPosition.y);

        if (complete)
        {
            selectedItem = null;
            lastPickupGrid = null;
            // 删除了 overlapItem 的处理逻辑
        }
    }

    private void HandleScroll()
    {
        if (selectedItem == null || lastPickupGrid == null) return;

        float scroll = Input.mouseScrollDelta.y;
        if (scroll == 0) return;

        InventoryItem itemAtSource = lastPickupGrid.GetItem(lastPickupOriginPosition.x, lastPickupOriginPosition.y);

        if (scroll < 0)
        {
            if (selectedItem.currentAmount > 1)
            {
                if (itemAtSource == null)
                {
                    // 在创建新分身前，也最好检查一次 CanPlaceItem（虽然通常是合法的）
                    if (lastPickupGrid.CanPlaceItem(selectedItem))
                    {
                        InventoryItem newItem = Instantiate(itemPrefab).GetComponent<InventoryItem>();
                        newItem.Set(selectedItem.itemData);
                        newItem.currentAmount = 1;

                        // PlaceItem 不再需要 ref 参数
                        lastPickupGrid.PlaceItem(newItem, lastPickupOriginPosition.x, lastPickupOriginPosition.y);
                    }
                }
                else
                {
                    if (itemAtSource.itemData == selectedItem.itemData)
                    {
                        if (itemAtSource.currentAmount < itemAtSource.itemData.maxamount)
                        {
                            itemAtSource.currentAmount++;
                            itemAtSource.RefreshCount();
                        }
                        else return;
                    }
                    else return;
                }

                selectedItem.currentAmount--;
                selectedItem.RefreshCount();
            }
        }
        else if (scroll > 0)
        {
            if (itemAtSource != null && itemAtSource.itemData == selectedItem.itemData)
            {
                if (selectedItem.currentAmount < selectedItem.itemData.maxamount)
                {
                    itemAtSource.currentAmount--;
                    selectedItem.currentAmount++;

                    if (itemAtSource.currentAmount <= 0)
                    {
                        lastPickupGrid.PickupItem(lastPickupOriginPosition.x, lastPickupOriginPosition.y);
                        Destroy(itemAtSource.gameObject);
                    }
                    else
                    {
                        itemAtSource.RefreshCount();
                    }

                    selectedItem.RefreshCount();
                }
            }
        }
    }

    private void PickUpItem(Vector2Int tileGridPosition)
    {
        InventoryItem targetItem = selectedItemGrid.GetItem(tileGridPosition.x, tileGridPosition.y);

        if (targetItem != null)
        {
            lastPickupOriginPosition = new Vector2Int(targetItem.onGridPositionX, targetItem.onGridPositionY);
            lastPickupGrid = selectedItemGrid;

            selectedItem = selectedItemGrid.PickupItem(tileGridPosition.x, tileGridPosition.y);

            if (selectedItem != null)
            {
                rectTransform = selectedItem.GetComponent<RectTransform>();
            }
        }
    }

    private Vector2Int GetTargetGridPosition()
    {
        Vector2 position = Input.mousePosition;

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

        if (selectedItemGrid.isEquipmentSlot == false)
        {
            if (positionOnGrid == oldPosition) { return; }
            oldPosition = positionOnGrid;
        }

        if (selectedItemGrid.isEquipmentSlot)
        {
            InventoryItem itemInSlot = selectedItemGrid.GetItem(0, 0);
            bool typeMatches = selectedItem != null && selectedItemGrid.CanPlaceItem(selectedItem);

            if (typeMatches || (selectedItem == null && itemInSlot != null))
            {
                highlighter.Show(true);
                RectTransform slotRect = selectedItemGrid.GetComponent<RectTransform>();
                highlighter.SetSize(slotRect.rect.size);
                highlighter.SetPositionToCenter(selectedItemGrid);
            }
            else
            {
                highlighter.Show(false);
            }
        }
        else
        {
            if (selectedItem == null)
            {
                bool isValidPosition = selectedItemGrid.BoundryCheck(positionOnGrid.x, positionOnGrid.y, 1, 1);
                if (!isValidPosition)
                {
                    highlighter.Show(false);
                    return;
                }

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

        inventoryItem.currentAmount = UnityEngine.Random.Range(2, 5);
        inventoryItem.RefreshCount();

        lastPickupGrid = null;
    }
}