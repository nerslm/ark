using UnityEngine;

public class ItemGrid : MonoBehaviour
{
    public const float tileSizeWidth = 64;
    public const float tileSizeHeight = 64;

    [Header("Configuration")]
    [SerializeField] public bool isEquipmentSlot = false;

    InventoryItem[,] inventoryItemSlot;
    RectTransform rectTransform;

    [SerializeField] int gridSizeWidth = 20;
    [SerializeField] int gridSizeHeight = 10;

    private void Start()
    {
        rectTransform = GetComponent<RectTransform>();

        if (isEquipmentSlot)
        {
            Init(1, 1);
        }
        else
        {
            Init(gridSizeWidth, gridSizeHeight);
        }
    }

    void Init(int width, int height)
    {
        inventoryItemSlot = new InventoryItem[width, height];

        if (!isEquipmentSlot)
        {
            Vector2 size = new Vector2(width * tileSizeWidth, height * tileSizeHeight);
            rectTransform.sizeDelta = size;
        }
    }

    Vector2 positionOnTheGrid = new Vector2();
    Vector2Int tileGridPosition = new Vector2Int();

    public Vector2Int GetTileGridPosition(Vector2 mousePosition)
    {
        if (isEquipmentSlot) return new Vector2Int(0, 0);

        positionOnTheGrid.x = mousePosition.x - rectTransform.position.x;
        positionOnTheGrid.y = rectTransform.position.y - mousePosition.y;

        tileGridPosition.x = (int)(positionOnTheGrid.x / tileSizeWidth);
        tileGridPosition.y = (int)(positionOnTheGrid.y / tileSizeHeight);
        return tileGridPosition;
    }

    public InventoryItem PickupItem(int posX, int posY)
    {
        int targetX = isEquipmentSlot ? 0 : posX;
        int targetY = isEquipmentSlot ? 0 : posY;

        InventoryItem toReturn = inventoryItemSlot[targetX, targetY];

        if (toReturn == null) { return null; }

        cleanGridReference(toReturn);

        if (isEquipmentSlot)
        {
            toReturn.GetComponent<RectTransform>().localScale = Vector3.one;
            toReturn.GetComponent<RectTransform>().pivot = new Vector2(0.5f, 0.5f);
        }

        return toReturn;
    }

    // --- 修改 1：清除引用时，如果是装备栏，只清除 [0,0] ---
    private void cleanGridReference(InventoryItem item)
    {
        // 关键逻辑：如果是装备栏，循环只跑 1 次；否则跑物品的宽/高次
        int loopWidth = isEquipmentSlot ? 1 : item.itemData.width;
        int loopHeight = isEquipmentSlot ? 1 : item.itemData.height;

        for (int x = 0; x < loopWidth; x++)
        {
            for (int y = 0; y < loopHeight; y++)
            {
                inventoryItemSlot[item.onGridPositionX + x, item.onGridPositionY + y] = null;
            }
        }
    }

    public bool PlaceItem(InventoryItem inventoryItem, int posX, int posY, ref InventoryItem overlapItem)
    {
        if (!isEquipmentSlot)
        {
            if (BoundryCheck(posX, posY, inventoryItem.itemData.width, inventoryItem.itemData.height) == false)
            {
                Debug.Log("Out of Boundry");
                return false;
            }
        }

        int targetX = isEquipmentSlot ? 0 : posX;
        int targetY = isEquipmentSlot ? 0 : posY;

        if (OverlapCheck(targetX, targetY, inventoryItem.itemData.width, inventoryItem.itemData.height, ref overlapItem) == false)
        {
            Debug.Log("Overlap Detected");
            overlapItem = null;
            return false;
        }

        if (overlapItem != null)
        {
            cleanGridReference(overlapItem);
        }

        RectTransform itemRect = inventoryItem.GetComponent<RectTransform>();
        itemRect.SetParent(this.rectTransform);

        // --- 修改 2：填充数组时，如果是装备栏，只填充 [0,0] ---
        int loopWidth = isEquipmentSlot ? 1 : inventoryItem.itemData.width;
        int loopHeight = isEquipmentSlot ? 1 : inventoryItem.itemData.height;

        for (int x = 0; x < loopWidth; x++)
        {
            for (int y = 0; y < loopHeight; y++)
            {
                inventoryItemSlot[targetX + x, targetY + y] = inventoryItem;
            }
        }

        inventoryItem.onGridPositionX = targetX;
        inventoryItem.onGridPositionY = targetY;

        itemRect.pivot = new Vector2(0.5f, 0.5f);

        if (isEquipmentSlot)
        {
            itemRect.localPosition = Vector2.zero;

            float scale = CalculateScale(inventoryItem);
            itemRect.localScale = new Vector3(scale, scale, 1);
        }
        else
        {
            itemRect.localScale = Vector3.one;
            itemRect.localPosition = CalculatePositionOnGrid(inventoryItem, targetX, targetY);
        }

        return true;
    }

    private float CalculateScale(InventoryItem item)
    {
        float slotW = rectTransform.rect.width;
        float slotH = rectTransform.rect.height;

        float itemW = item.itemData.width * tileSizeWidth;
        float itemH = item.itemData.height * tileSizeHeight;

        return Mathf.Min(slotW / itemW, slotH / itemH) * 0.95f;
    }

    public Vector2 CalculatePositionOnGrid(InventoryItem inventoryItem, int posX, int posY)
    {
        Vector2 position = new Vector2();
        position.x = posX * tileSizeWidth + tileSizeWidth * inventoryItem.itemData.width / 2;
        position.y = -(posY * tileSizeHeight + tileSizeHeight * inventoryItem.itemData.height / 2);
        return position;
    }

    private bool OverlapCheck(int posX, int posY, int width, int height, ref InventoryItem overlapItem)
    {
        int checkWidth = isEquipmentSlot ? 1 : width;
        int checkHeight = isEquipmentSlot ? 1 : height;

        for (int x = 0; x < checkWidth; x++)
        {
            for (int y = 0; y < checkHeight; y++)
            {
                // 加上安全检查，虽然前面的 Init 和 LoopWidth 配合好应该不会越界，但双重保险
                if (posX + x < inventoryItemSlot.GetLength(0) && posY + y < inventoryItemSlot.GetLength(1))
                {
                    if (inventoryItemSlot[posX + x, posY + y] != null)
                    {
                        if (overlapItem == null)
                        {
                            overlapItem = inventoryItemSlot[posX + x, posY + y];
                        }
                        else
                        {
                            if (overlapItem != inventoryItemSlot[posX + x, posY + y])
                            {
                                return false;
                            }
                        }
                    }
                }
            }
        }
        return true;
    }

    bool PositionCheck(int X, int Y)
    {
        if (X < 0 || Y < 0) return false;
        if (X >= gridSizeWidth || Y >= gridSizeHeight) return false;
        return true;
    }

    public bool BoundryCheck(int X, int Y, int width, int height)
    {
        if (isEquipmentSlot) return true;

        if (PositionCheck(X, Y) == false) return false;

        X += width - 1;
        Y += height - 1;

        if (PositionCheck(X, Y) == false) return false;

        return true;
    }

    internal InventoryItem GetItem(int x, int y)
    {
        if (isEquipmentSlot) return inventoryItemSlot[0, 0];
        return inventoryItemSlot[x, y];
    }
}