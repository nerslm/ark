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
            Debug.Log("no grid selected");
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
        if (positionOnGrid == oldPosition) { return; }
        oldPosition = positionOnGrid;
        if (selectedItem == null)
        {
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
