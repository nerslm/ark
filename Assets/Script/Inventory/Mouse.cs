using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using TMPro;

public class Mouse : MonoBehaviour
{
    public GameObject mouseItemUI;
    public Image MouseCursor;
    public ItemSlotInfo itemSlotInfo;
    public Image itemImage;
    public TextMeshProUGUI amountText;

    public ItemSlot sourceItemSlot;
    public int splitSize;

    void Update()
    {
        transform.position = Input.mousePosition;
        if (Cursor.lockState == CursorLockMode.Locked)
        {
            MouseCursor.enabled = false;
            mouseItemUI.SetActive(false);
        }
        else
        {
            MouseCursor.enabled = true;
            if (itemSlotInfo.slotItem != null)
            {
                mouseItemUI.SetActive(true);
            }
            else
            {
                mouseItemUI.SetActive(false);
            }
        }

        if (itemSlotInfo.slotItem != null)
        {
            if (Input.GetAxis("Mouse ScrollWheel") > 0f && splitSize < itemSlotInfo.amount)//向上滚动
            {
                splitSize++;
            }
            else if (Input.GetAxis("Mouse ScrollWheel") < 0f && splitSize > 1)//向下滚动
            {
                splitSize--;
            }
            amountText.text = "" + splitSize;
            if (splitSize == itemSlotInfo.amount) sourceItemSlot.AmountText.gameObject.SetActive(false);
            /*
            else
            {
                sourceItemSlot.AmountText.gameObject.SetActive(true);
                sourceItemSlot.AmountText.text = "" + (itemSlotInfo.amount - splitSize);
            }//感觉这里不好，直接改变sourceItemSlot上的text,会导致容器刷新时，数字又变回去
            */
        }
    }


    public void EmptySlot()
    {
        itemSlotInfo = new ItemSlotInfo(null, 0);
    }

    public void SetUI()
    {
        amountText.text = "" + splitSize;
        itemImage.sprite = itemSlotInfo.slotItem.itemIcon;
    }


}


