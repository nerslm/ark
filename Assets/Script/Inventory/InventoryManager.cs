using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using TMPro;
using UnityEngine;
using UnityEngine.UI;


public class InventoryManager : MonoBehaviour//负责UI以及角色背包的管理
{

    public static InventoryManager instance;

    public Inventory bagInventory = new Inventory();//玩家的背包，因为玩家的背包是固定的所以直接new一个就行了，加东西就用bag.itemSlotList.Add()就行
    public static Dictionary<string, Item> itemDictionary = new Dictionary<string, Item>();//物品字典，用于通过名字查找物品
                                                                                           //配方Database
    public List<Recipe> allRecipes = new List<Recipe>();//所有配方列表

    [Header("Bag UI")]
    public int bagSize = 24;//背包的大小
    public GameObject bagMenu;//背包菜单
    public GameObject bagslotGrid;
    public GameObject slotPrefab;
    public TMP_Text itemInfo;//显示物品信息的文本框
    public Mouse mouse;//鼠标脚本
    private List<ItemSlot> bagSlotList = new List<ItemSlot>();//存放生成的slot

    [Header("Container UI")]
    public GameObject containerMenu;//整个容器菜单
    public GameObject containerSlotGrid;
    public GameObject containerSlotPrefab;//和背包的slotPrefab是同一个预制体
    public TMP_Text containerItemInfo;//显示容器物品信息的文本框
    private List<ItemSlot> containerSlotList = new List<ItemSlot>();//存放生成的slot

    [Header("Maker UI")]
    public GameObject makerMenu;//整个制造器菜单
    public GameObject makerInputSlotGrid;
    public GameObject makerOutputSlotGrid;
    public GameObject makerSlotPrefab;//和背包的slotPrefab是同一个预制体

    public Image makerProgressBar;//制造进度条
    public TMP_Text makerProgressText;//制造进度文本
    public List<ItemSlot> makerSlotList = new List<ItemSlot>();//存放生成的slot
    //public TMP_Text makerItemInfo;//显示制造器物品信息的文本框

    [Header("Container and Maker interaction")]
    [HideInInspector]
    public bool isNearContainer = false;//是否检测到容器建筑
    [HideInInspector]
    public GameObject nearbyContainerBuilding;//当前检测到的最近的容器建筑
    [HideInInspector]
    public Container container;//当前打开的容器
    public float containerCheckDistance = 5f;//检查容器的距离

    void Awake()
    {
        //单例模式
        if (instance != null)
        {
            Destroy(gameObject);
        }
        instance = this;

        //初始化物品字典
        Item[] allItemsArray = Resources.LoadAll<Item>("Item/ItemData");
        List<Item> allItems = allItemsArray.ToList();
        foreach (Item i in allItems)
        {
            if (!itemDictionary.ContainsKey(i.itemName))
            {
                itemDictionary.Add(i.itemName, i);
            }
            else
            {
                Debug.LogWarning("" + i + " already exists in the dictionary - shares name with " + itemDictionary[i.itemName]);
            }
        }

        //初始化所有配方（制造用）
        Recipe[] allRecipesArray = Resources.LoadAll<Recipe>("Item/Recipe");
        allRecipes = allRecipesArray.ToList();
    }

    void Start()
    {

        //初始化背包列表
        for (int i = 0; i < bagSize; i++)
        {
            bagInventory.itemSlotList.Add(new ItemSlotInfo(null, 0));
        }

        //添加测试物品
        AddItem("Wood", 15, bagInventory);
        AddItem("Stone", 8, bagInventory);
        AddItem("Metal", 10, bagInventory);

    }

    void Update()
    {
        //检查附近是否有容器，一个函数，得到Container对象,同时赋值isNearContainer
        CheckForNearbyContainer();

        //打开关闭背包
        // 打开/关闭背包 (I键)
        if (Input.GetKeyDown(KeyCode.I))
        {
            if (bagMenu.activeSelf)
            {
                bagMenu.SetActive(false);
                mouse.EmptySlot();
                Cursor.lockState = CursorLockMode.Locked;
            }
            else
            {
                bagMenu.SetActive(true);
                Cursor.lockState = CursorLockMode.Confined;
                RefreshBagMenu();
            }
        }

        //容器交互
        if (Input.GetKeyDown(KeyCode.E) && isNearContainer)
        {
            if (containerMenu.activeSelf)
            {
                //关闭容器和bag menu
                containerMenu.SetActive(false);
                bagMenu.SetActive(false);
                mouse.EmptySlot();
                container = null;
                Cursor.lockState = CursorLockMode.Locked;
            }
            else
            {
                if (container != null)
                {
                    //打开容器和bag menu
                    bagMenu.SetActive(true);
                    //如果是制造器
                    if (container.isMaker)
                    {
                        makerMenu.SetActive(true);
                        containerMenu.SetActive(false);
                    }
                    else
                    {
                        makerMenu.SetActive(false);
                        containerMenu.SetActive(true);
                    }
                    Cursor.lockState = CursorLockMode.Confined;

                    //刷新容器和背包
                    RefreshBagMenu();
                    RefreshContainerMenu();
                }
            }
        }

        //Esc关闭所有菜单
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            bagMenu.SetActive(false);
            containerMenu.SetActive(false);
            makerMenu.SetActive(false);
            mouse.EmptySlot();
            container = null;
            Cursor.lockState = CursorLockMode.Locked;
        }

        if (Input.GetKeyDown(KeyCode.Mouse1) && mouse.itemSlotInfo.slotItem != null)//右键
        {
            RefreshBagMenu();
            if (containerMenu.activeSelf)
            {
                RefreshContainerMenu();
            }
        }

        //当容器界面打开时持续刷新容器界面
        if (containerMenu.activeSelf || makerMenu.activeSelf)
        {
            RefreshContainerMenu();
        }
    }

    public void RefreshBagMenu()
    {
        //首先对齐slot数量
        bagSlotList = bagslotGrid.GetComponentsInChildren<ItemSlot>().ToList();//现有的slot列表
        if (bagSlotList.Count < bagSize)//slot数量不够
        {
            int amountToAdd = bagSize - bagSlotList.Count;
            for (int i = 0; i < amountToAdd; i++)
            {
                GameObject newSlot = Instantiate(slotPrefab, bagslotGrid.transform);
                bagSlotList.Add(newSlot.GetComponent<ItemSlot>());//添加到slot列表
            }

        }

        int index = 0;
        foreach (ItemSlotInfo i in bagInventory.itemSlotList)
        {
            i.name = "" + (index + 1);
            if (i.slotItem != null) i.name += ": " + i.slotItem.itemName;
            else i.name += ": -";

            ItemSlot slot = bagSlotList[index];
            slot.name = i.name + " Slot";
            if (slot != null)
            {
                slot.inventoryManager = this;//告诉每各个slot它的inventoryManager是谁，解决多背包时的引用问题
                slot.itemSlotInfo = i;//告诉每个slot它对应的ItemSlotInfo
                if (i.slotItem != null)
                {
                    slot.itemImage.gameObject.SetActive(true);
                    slot.itemImage.sprite = i.slotItem.itemIcon;
                    slot.itemImage.CrossFadeAlpha(1f, 0.05f, true);//恢复透明度
                    slot.AmountText.gameObject.SetActive(true);
                    slot.AmountText.text = "" + i.amount;
                }
                else
                {
                    slot.itemImage.gameObject.SetActive(false);
                    slot.AmountText.gameObject.SetActive(false);
                }
            }
            index++;
        }
        mouse.EmptySlot();
    }

    public void RefreshContainerMenu()
    {
        if (container == null) return;

        //区分容器UI和制造器UI
        if (!container.isMaker)
        {
            //获取容器slotlist
            containerSlotList = containerSlotGrid.GetComponentsInChildren<ItemSlot>().ToList();//现有的slot列表

            //首先对齐slot数量
            if (containerSlotList.Count < container.containerSize)//slot数量不够
            {
                int amountToAdd = container.containerSize - containerSlotList.Count;
                for (int i = 0; i < amountToAdd; i++)
                {
                    GameObject newSlot = Instantiate(containerSlotPrefab, containerSlotGrid.transform);
                    containerSlotList.Add(newSlot.GetComponent<ItemSlot>());//添加到slot列表
                }

            }

            //数量多余的slot删除
            if (containerSlotList.Count > container.containerSize)
            {
                int amountToRemove = containerSlotList.Count - container.containerSize;
                for (int i = 0; i < amountToRemove; i++)
                {
                    ItemSlot slotToRemove = containerSlotList[containerSlotList.Count - 1];
                    containerSlotList.RemoveAt(containerSlotList.Count - 1);
                    Destroy(slotToRemove.gameObject);
                }
            }

            //刷新每个slot
            int index = 0;
            foreach (ItemSlotInfo i in container.containerInventory.itemSlotList)
            {
                i.name = "" + (index + 1);
                if (i.slotItem != null) i.name += ": " + i.slotItem.itemName;
                else i.name += ": -";

                ItemSlot slot = containerSlotList[index];
                slot.name = i.name + " Slot";
                if (slot != null)
                {
                    slot.inventoryManager = this;//告诉每各个slot它的inventoryManager是谁，解决多背包时的引用问题
                    slot.itemSlotInfo = i;//告诉每个slot它对应的ItemSlotInfo
                    slot.isContainerSlot = true;//告诉slot它是容器的slot
                    slot.containerStorage = container;//告诉slot它属于哪个容器

                    if (i.slotItem != null)
                    {
                        slot.itemImage.gameObject.SetActive(true);
                        slot.itemImage.sprite = i.slotItem.itemIcon;
                        slot.itemImage.CrossFadeAlpha(1f, 0.05f, true);//恢复透明度
                        slot.AmountText.gameObject.SetActive(true);
                        slot.AmountText.text = "" + i.amount;
                    }
                    else
                    {
                        slot.itemImage.gameObject.SetActive(false);
                        slot.AmountText.gameObject.SetActive(false);
                    }
                }
                index++;
            }
        }

        else if (container.isMaker)//就是制造器，刷新制造器UI
        {
            if (container == null || !container.isMaker || container.currentRecipe == null) return;

            // 1. 输入格刷新
            var inputSlots = makerInputSlotGrid.GetComponentsInChildren<ItemSlot>().ToList();
            int inputCount = container.currentRecipe.inputs.Count;
            // 补齐slot数量
            while (inputSlots.Count < inputCount)
            {
                GameObject newSlot = Instantiate(makerSlotPrefab, makerInputSlotGrid.transform);
                inputSlots.Add(newSlot.GetComponent<ItemSlot>());
            }
            while (inputSlots.Count > inputCount)
            {
                Destroy(inputSlots[inputSlots.Count - 1].gameObject);
                inputSlots.RemoveAt(inputSlots.Count - 1);
            }
            // 刷新输入格内容
            for (int i = 0; i < inputCount; i++)
            {
                var slotInfo = container.containerInventory.itemSlotList[i];
                var slot = inputSlots[i];
                slot.inventoryManager = this;
                slot.itemSlotInfo = slotInfo;
                slot.isContainerSlot = true;
                slot.containerStorage = container;
                if (slotInfo.slotItem != null)
                {
                    slot.itemImage.gameObject.SetActive(true);
                    slot.itemImage.sprite = slotInfo.slotItem.itemIcon;
                    slot.itemImage.CrossFadeAlpha(1f, 0.05f, true);
                    slot.AmountText.gameObject.SetActive(true);
                    slot.AmountText.text = "" + slotInfo.amount;
                }
                else
                {
                    slot.itemImage.gameObject.SetActive(false);
                    slot.AmountText.gameObject.SetActive(false);
                }
            }

            // 2. 输出格刷新
            var outputSlots = makerOutputSlotGrid.GetComponentsInChildren<ItemSlot>().ToList();
            int outputCount = container.currentRecipe.outputs.Count;
            // 补齐slot数量
            while (outputSlots.Count < outputCount)
            {
                GameObject newSlot = Instantiate(makerSlotPrefab, makerOutputSlotGrid.transform);
                outputSlots.Add(newSlot.GetComponent<ItemSlot>());
            }
            while (outputSlots.Count > outputCount)
            {
                Destroy(outputSlots[outputSlots.Count - 1].gameObject);
                outputSlots.RemoveAt(outputSlots.Count - 1);
            }
            // 刷新输出格内容
            for (int i = 0; i < outputCount; i++)
            {
                var slotInfo = container.containerInventory.itemSlotList[inputCount + i];
                var slot = outputSlots[i];
                slot.inventoryManager = this;
                slot.itemSlotInfo = slotInfo;
                slot.isContainerSlot = true;
                slot.containerStorage = container;
                if (slotInfo.slotItem != null)
                {
                    slot.itemImage.gameObject.SetActive(true);
                    slot.itemImage.sprite = slotInfo.slotItem.itemIcon;
                    slot.itemImage.CrossFadeAlpha(1f, 0.05f, true);
                    slot.AmountText.gameObject.SetActive(true);
                    slot.AmountText.text = "" + slotInfo.amount;
                }
                else
                {
                    slot.itemImage.gameObject.SetActive(false);
                    slot.AmountText.gameObject.SetActive(false);
                }
            }

            //3. 制造进度条刷新和进度文本刷新
            if (makerProgressBar != null && container != null && container.isMaker && container.currentRecipe != null)
            {
                float percent = container.craftTimer / container.currentRecipe.craftTime;
                makerProgressBar.fillAmount = Mathf.Clamp01(percent);
                //直接显示倒计时时间
                makerProgressText.text = (container.currentRecipe.craftTime - container.craftTimer).ToString("F1") + "s";
            }

        }

        //mouse.EmptySlot();


    }
    //容器添加物品的接口
    public int AddItem(string itemName, int amount, Inventory inventory)//向库存添加物品，返回未添加的数量，每各库存各自有自己的AddItem，管好自己代码中的库存就好
    {
        Item item = null;
        itemDictionary.TryGetValue(itemName, out item);
        if (item == null)//不在字典则退出
        {
            Debug.LogWarning("Item " + itemName + " not found in dictionary!");
            return amount; //返回全部未添加
        }

        //首先检查存在的堆叠

        foreach (ItemSlotInfo i in inventory.itemSlotList)
        {
            if (i.slotItem != null)
            {
                if (i.slotItem.itemName == itemName)//找到相同物品
                {
                    if (amount > i.slotItem.maxStack - i.amount)//如果要添加的数量大于这个堆叠能添加的数量
                    {
                        amount -= (i.slotItem.maxStack - i.amount);//减少要添加的数量
                        i.amount = i.slotItem.maxStack;//堆叠加满
                    }
                    else
                    {
                        i.amount += amount;//直接添加完毕
                        amount = 0;
                        return amount;//返回0，表示全部添加完毕
                    }
                }
            }
        }

        //检查空格子
        foreach (ItemSlotInfo i in inventory.itemSlotList)
        {
            if (i.slotItem == null)//找到空格子
            {
                if (amount > item.maxStack)//如果要添加的数量大于单个堆叠的最大数量
                {
                    amount -= item.maxStack;
                    i.slotItem = item;
                    i.amount = item.maxStack;
                }
                else
                {
                    i.slotItem = item;
                    i.amount = amount;
                    if (bagMenu.activeSelf)//如果背包界面是打开的就刷新
                    {
                        RefreshBagMenu();
                    }
                    if (containerMenu.activeSelf)
                    {
                        RefreshContainerMenu();
                    }
                    return 0;//返回0，表示全部添加完毕
                }
            }
        }

        //库存不足时,因为经过前面的检查，能到这里说明库存满了
        Debug.Log("Inventory full, could not add all items. ");
        if (bagMenu.activeSelf)//如果背包界面是打开的就刷新
        {
            RefreshBagMenu();
        }
        if (containerMenu.activeSelf)
        {
            RefreshContainerMenu();
        }
        return amount;
    }

    //制造建筑添加物品的接口
    public int AddItemToMaker(string itemName, int amount, Container maker)
    {
        Item item = null;
        itemDictionary.TryGetValue(itemName, out item);
        if (item == null) return amount;

        // 只允许加到输入格
        if (maker.TryAddInputItem(item, amount))
            return 0; // 全部加完
        else
            return amount; // 没加进去
    }

    public void ClearSlot(ItemSlotInfo slot)
    {
        if (slot != null)
        {
            slot.slotItem = null;
            slot.amount = 0;
        }
    }

    private void CheckForNearbyContainer()
    {
        Camera mainCamera = Camera.main;
        if (mainCamera == null)
        {
            Debug.LogError("Container Detection, Main Camera not found!");
            return;
        }

        // 射线检测
        Vector3 rayOrigin = mainCamera.transform.position;
        Vector3 rayDirection = mainCamera.transform.forward;

        RaycastHit hitInfo;
        container = null;
        // 发射射线

        if (Physics.Raycast(rayOrigin, rayDirection, out hitInfo, containerCheckDistance))
        {
            // 检测到物体
            GameObject hitObject = hitInfo.collider.gameObject;

            //从射线击中的物体向上查找，找到Building有组件的父物体
            Transform currentTransform = hitObject.transform;
            GameObject buildingRoot = null;

            while (currentTransform != null)
            {
                Building building = currentTransform.GetComponent<Building>();
                if (building != null)
                {
                    buildingRoot = currentTransform.gameObject;
                    break;
                }
                currentTransform = currentTransform.parent;
            }

            //如果找到了Building物体，检查它是否是容器类型
            if (buildingRoot != null)
            {
                Building building = buildingRoot.GetComponent<Building>();
                if (building != null && building.Type == BuildingType.Container)
                {
                    //在建筑根物体下查找Container组件
                    Container containerComponent = buildingRoot.GetComponentInChildren<Container>();
                    if (containerComponent != null)
                    {
                        container = containerComponent;
                        //Debug.Log("Detected Container Building: " + buildingRoot.name);
                    }
                }

            }
        }

        //更新检测状态
        if (container != null)
        {
            isNearContainer = true;
        }
        else
        {
            isNearContainer = false;
            //关闭容器和maker menu
            containerMenu.SetActive(false);
            makerMenu.SetActive(false);
        }

    }
}


/*如何操作数据，如下
list.Add(new ItemSlotInfo(null, 0));
foreach (var i in list)
{
    i.amount = 10; // 这里改i，其实就是改list[0].amount
}
*/