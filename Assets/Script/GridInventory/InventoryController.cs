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

    // 记录来源网格
    ItemGrid lastPickupGrid;
    // --- 修复说明：这里记录的必须是物品的【左上角原点】，而不是鼠标点击的位置 ---
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
            if (selectedItem == null)
            {
                CreateRandomItem();
            }
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

            if (selectedItem == null)
            {
                PickUpItem(tileGridPosition);
            }
            else
            {
                InventoryItem itemOnGrid = selectedItemGrid.GetItem(tileGridPosition.x, tileGridPosition.y);

                if (itemOnGrid != null)
                {
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
                        return;
                    }
                }
                else
                {
                    PlaceItem(tileGridPosition);
                }
            }
        }
    }

    private void HandleScroll()
    {
        if (selectedItem == null || lastPickupGrid == null) return;

        float scroll = Input.mouseScrollDelta.y;
        if (scroll == 0) return;

        // --- 修复偏移：使用记录的【左上角原点】来获取或生成物品 ---
        // 这样无论大物品多大，都会从它的左上角开始判断
        InventoryItem itemAtSource = lastPickupGrid.GetItem(lastPickupOriginPosition.x, lastPickupOriginPosition.y);

        if (scroll < 0)
        {
            if (selectedItem.currentAmount > 1)
            {
                if (itemAtSource == null)
                {
                    InventoryItem newItem = Instantiate(itemPrefab).GetComponent<InventoryItem>();
                    newItem.Set(selectedItem.itemData);
                    newItem.currentAmount = 1;
                    InventoryItem tempOverlap = null;

                    // --- 修复偏移：放置到原本的左上角位置 ---
                    lastPickupGrid.PlaceItem(newItem, lastPickupOriginPosition.x, lastPickupOriginPosition.y, ref tempOverlap);
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
                        // --- 修复偏移：移除时也使用左上角坐标 ---
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
        // 此时 tileGridPosition 是鼠标点击的位置（可能是大物品的中间）
        // 我们先通过这个位置找到物品
        InventoryItem targetItem = selectedItemGrid.GetItem(tileGridPosition.x, tileGridPosition.y);

        // 如果找到了物品，先记录下它的真实原点（左上角），然后再把它拿起来
        if (targetItem != null)
        {
            // --- 修复偏移关键点：记录物品自身的Grid坐标，而不是鼠标坐标 ---
            lastPickupOriginPosition = new Vector2Int(targetItem.onGridPositionX, targetItem.onGridPositionY);
            lastPickupGrid = selectedItemGrid;

            // 执行实际的 Pickup 操作（这会把物品从 Grid 移除）
            selectedItem = selectedItemGrid.PickupItem(tileGridPosition.x, tileGridPosition.y);

            if (selectedItem != null)
            {
                rectTransform = selectedItem.GetComponent<RectTransform>();
            }
        }
    }

    private void PlaceItem(Vector2Int tileGridPosition)
    {
        bool complete = selectedItemGrid.PlaceItem(selectedItem, tileGridPosition.x, tileGridPosition.y, ref overlapItem);
        if (complete)
        {
            selectedItem = null;
            lastPickupGrid = null;

            if (overlapItem != null)
            {
                selectedItem = overlapItem;
                rectTransform = selectedItem.GetComponent<RectTransform>();

                // --- 修复偏移：如果是交换（虽然现在逻辑禁用了交换，但留着也没错）---
                // 记录新拿起来的物品的左上角
                lastPickupGrid = selectedItemGrid;
                lastPickupOriginPosition = new Vector2Int(selectedItem.onGridPositionX, selectedItem.onGridPositionY);
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

            if (selectedItem != null || itemInSlot != null)
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