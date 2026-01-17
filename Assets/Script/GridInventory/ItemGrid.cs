using UnityEngine;
using System.Collections;
using Unity.VisualScripting;
using UnityEngine.UIElements;
using System;


public class ItemGrid : MonoBehaviour
{
    public const float tileSizeWidth = 64;
    public const float tileSizeHeight = 64;

    InventoryItem[,] inventoryItemSlot;

    RectTransform rectTransform;

    [SerializeField] int gridSizeWidth = 20;
    [SerializeField] int gridSizeHeight = 10;



    private void Start()
    {
        rectTransform = GetComponent<RectTransform>();
        Init(gridSizeWidth, gridSizeHeight);



    }

    void Init(int width, int height)
    {
        inventoryItemSlot = new InventoryItem[width, height];
        Vector2 size = new Vector2(width * tileSizeWidth, height * tileSizeHeight);
        rectTransform.sizeDelta = size;
    }

    Vector2 positionOnTheGrid = new Vector2();
    Vector2Int tileGridPosition = new Vector2Int();

    public Vector2Int GetTileGridPosition(Vector2 mousePosition)
    {
        positionOnTheGrid.x = mousePosition.x - rectTransform.position.x;
        positionOnTheGrid.y = rectTransform.position.y - mousePosition.y;


        tileGridPosition.x = (int)(positionOnTheGrid.x / tileSizeWidth);
        tileGridPosition.y = (int)(positionOnTheGrid.y / tileSizeHeight);
        return tileGridPosition;
    }

    public InventoryItem PickupItem(int posX, int posY)
    {
        InventoryItem toReturn = inventoryItemSlot[posX, posY];

        if (toReturn == null) { return null; }

        cleanGridReference(toReturn);
        return toReturn;
    }

    private void cleanGridReference(InventoryItem item)
    {
        for (int x = 0; x < item.itemData.width; x++)
        {
            for (int y = 0; y < item.itemData.height; y++)
            {
                inventoryItemSlot[item.onGridPositionX + x, item.onGridPositionY + y] = null;
            }
        }
    }

    public bool PlaceItem(InventoryItem inventoryItem, int posX, int posY, ref InventoryItem overlapItem)
    {
        if (BoundryCheck(posX, posY, inventoryItem.itemData.width, inventoryItem.itemData.height) == false)
        {
            Debug.Log("Out of Boundry");
            return false;
        }

        if (OverlapCheck(posX, posY, inventoryItem.itemData.width, inventoryItem.itemData.height, ref overlapItem) == false)
        {
            Debug.Log("Overlap Detected");
            overlapItem = null;
            return false;
        }

        if (overlapItem != null)
        {
            cleanGridReference(overlapItem);
        }

        RectTransform rectTransform = inventoryItem.GetComponent<RectTransform>();
        rectTransform.SetParent(this.rectTransform);

        for (int x = 0; x < inventoryItem.itemData.width; x++)
        {
            for (int y = 0; y < inventoryItem.itemData.height; y++)
            {
                inventoryItemSlot[posX + x, posY + y] = inventoryItem;
            }
        }

        inventoryItem.onGridPositionX = posX;
        inventoryItem.onGridPositionY = posY;

        Vector2 position = CalculatePositionOnGrid(inventoryItem, posX, posY);

        rectTransform.localPosition = position;

        return true;
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
        for(int x=0;x<width;x++)
        {
            for(int y=0;y<height;y++)
            {
                if(inventoryItemSlot[posX + x, posY + y] != null)
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
        return true;
    }

    bool PositionCheck(int X, int Y)
    {
        if (X < 0 || Y < 0)
        {
            return false;
        }
        if (X >= gridSizeWidth || Y >= gridSizeHeight)
        {
            return false;
        }
        return true;
    }

    public bool BoundryCheck(int X,int Y,int width,int height)
    {
        if (PositionCheck(X, Y) == false)
        {
            return false;
        }

        X += width -1;
        Y += height -1;

        if (PositionCheck(X, Y) == false)
        {
            return false;
        }
        
        return true;
    }

    internal InventoryItem GetItem(int x, int y)
    {
        return inventoryItemSlot[x, y];
    }
}
