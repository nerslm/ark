using UnityEngine;

public class ItemGrid : MonoBehaviour
{
    public const float tileSizeWidth = 64;
    public const float tileSizeHeight = 64;

    [Header("Configuration")]
    [SerializeField] public bool isEquipmentSlot = false;
    [SerializeField] public ItemType equipmentType;

    InventoryItem[,] inventoryItemSlot;
    RectTransform rectTransform;

    [SerializeField] int gridSizeWidth = 20;
    [SerializeField] int gridSizeHeight = 10;

    [Header("Equipment Link")]
    // --- 新增：如果是装备栏，请把场景里的 Player 拖进去 ---
    [SerializeField] PlayerStatus playerStatus;

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

    // --- 核心修改：精简后的放置逻辑，不再处理交换 ---
    public bool PlaceItem(InventoryItem inventoryItem, int posX, int posY)
    {
        if (!isEquipmentSlot)
        {
            // 1. 边界检查
            if (BoundryCheck(posX, posY, inventoryItem.itemData.width, inventoryItem.itemData.height) == false)
            {
                return false;
            }
        }

        int targetX = isEquipmentSlot ? 0 : posX;
        int targetY = isEquipmentSlot ? 0 : posY;

        // 2. 碰撞检查：只要区域内有任何东西，就禁止放置（返回 false）
        if (IsAreaClean(targetX, targetY, inventoryItem.itemData.width, inventoryItem.itemData.height) == false)
        {
            return false;
        }

        // 3. 执行放置
        RectTransform itemRect = inventoryItem.GetComponent<RectTransform>();
        itemRect.SetParent(this.rectTransform);

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
            // --- 新增：如果是装备栏，且放置成功，说明是“穿上” ---
            if (playerStatus != null)
            {
                playerStatus.EquipItem(inventoryItem.itemData);
            }
            // -----------------------------------------------------
        }
        else
        {
            itemRect.localScale = Vector3.one;
            itemRect.localPosition = CalculatePositionOnGrid(inventoryItem, targetX, targetY);
        }

        return true;
    }

    // --- 新增：简单的区域干净检查 ---
    // 返回 true 表示全是空的，可以放
    private bool IsAreaClean(int posX, int posY, int width, int height)
    {
        int checkWidth = isEquipmentSlot ? 1 : width;
        int checkHeight = isEquipmentSlot ? 1 : height;

        for (int x = 0; x < checkWidth; x++)
        {
            for (int y = 0; y < checkHeight; y++)
            {
                if (posX + x < inventoryItemSlot.GetLength(0) && posY + y < inventoryItemSlot.GetLength(1))
                {
                    // 只要发现任何非空格子，直接判定为不干净
                    if (inventoryItemSlot[posX + x, posY + y] != null)
                    {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    public InventoryItem PickupItem(int posX, int posY)
    {
        int targetX = isEquipmentSlot ? 0 : posX;
        int targetY = isEquipmentSlot ? 0 : posY;

        InventoryItem toReturn = inventoryItemSlot[targetX, targetY];

        if (toReturn == null) { return null; }

        // --- 新增：如果是装备栏，且拿起了东西，说明是“脱下” ---
        if (isEquipmentSlot && playerStatus != null)
        {
            playerStatus.UnequipItem(toReturn.itemData);
        }
        // -----------------------------------------------------

        cleanGridReference(toReturn);

        if (isEquipmentSlot)
        {
            toReturn.GetComponent<RectTransform>().localScale = Vector3.one;
            toReturn.GetComponent<RectTransform>().pivot = new Vector2(0.5f, 0.5f);
        }

        return toReturn;
    }

    private void cleanGridReference(InventoryItem item)
    {
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

    // --- Controller 用于堆叠判断的辅助方法 ---
    public InventoryItem GetItemInArea(int posX, int posY, int width, int height)
    {
        if (isEquipmentSlot) return inventoryItemSlot[0, 0];

        for (int x = 0; x < width; x++)
        {
            for (int y = 0; y < height; y++)
            {
                int targetX = posX + x;
                int targetY = posY + y;

                if (targetX < 0 || targetX >= gridSizeWidth || targetY < 0 || targetY >= gridSizeHeight) continue;

                if (inventoryItemSlot[targetX, targetY] != null)
                {
                    return inventoryItemSlot[targetX, targetY];
                }
            }
        }
        return null;
    }

    // --- 验证类型 ---
    public bool CanPlaceItem(InventoryItem item)
    {
        if (isEquipmentSlot == false) return true;
        if (item.itemData.itemType == equipmentType) return true;
        return false;
    }

    // --- 辅助计算 ---
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

    public Vector2Int GetTileGridPosition(Vector2 mousePosition)
    {
        if (isEquipmentSlot) return new Vector2Int(0, 0);

        Vector2 positionOnTheGrid = new Vector2();
        positionOnTheGrid.x = mousePosition.x - rectTransform.position.x;
        positionOnTheGrid.y = rectTransform.position.y - mousePosition.y;

        Vector2Int tileGridPosition = new Vector2Int();
        tileGridPosition.x = (int)(positionOnTheGrid.x / tileSizeWidth);
        tileGridPosition.y = (int)(positionOnTheGrid.y / tileSizeHeight);
        return tileGridPosition;
    }

    // 边界检查保持不变
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

    // 堆叠接口
    public int AddToStack(InventoryItem item, int amountToAdd)
    {
        // 装备栏等无法堆叠的逻辑在Controller控制，这里只是为了兼容性
        return 0;
    }
}