using UnityEngine;
using System.Collections.Generic;
using System.Linq;
using Unity.VisualScripting;


public class Container : MonoBehaviour
{
    [Header("Container Settings")]
    public int containerSize;//容器的大小
    public Inventory containerInventory = new Inventory();//容器的库存

    [Header("Container Output Settings")]

    public List<GameObject> outputBuildings = new List<GameObject>();//容器连接的输出建筑列表,因为一个容器可能连接输出建筑
    public List<GameObject> inputBuildings = new List<GameObject>();//容器连接的输入建筑列表

    public float outputInterval = 0.1f;//输出间隔时间
    private float lastOutputTime = 0f;

    [Header("Maker Settings")]

    public bool isMaker = false;//是否是制造建筑

    public Recipe currentRecipe; // 这个配方由玩家自己选择（通过InventorySystem）

    public float craftTimer = 0f;//制造计时器

    void Start()
    {


        if (isMaker)
        {
            //根据制造类型为每个格子添加初始物品（item存在但是数量为0，此外还要添加保持逻辑，保证item存在）
            InitSlotsByRecipe();
        }

        else
        {
            //初始化容器格子
            for (int i = 0; i < containerSize; i++)
            {
                containerInventory.itemSlotList.Add(new ItemSlotInfo(null, 0));//初始化容器格子，每个格子为空，堆叠数为0
            }

            //是容器再添加
            if (GetComponentInParent<Building>().Type == BuildingType.Container)
            {
                InventoryManager.instance.AddItem("Wood", 3, containerInventory);//测试添加物品
                InventoryManager.instance.AddItem("Stone", 5, containerInventory);//测试添加物品

            }
        }

    }

    void Update()
    {
        //容器建筑的输出逻辑
        if (outputBuildings.Count > 0 && Time.time - lastOutputTime >= outputInterval && !isMaker)
        {
            Debug.Log("2");
            TryOutPutItem();//如果是制造建筑只需要在输出时加上一个过滤，只输出制造的物品即可
        }

        //制造建筑的制造逻辑
        if (isMaker && currentRecipe != null)
        {
            if (CanCraft())
            {
                craftTimer += Time.deltaTime;
                if (craftTimer >= currentRecipe.craftTime)
                {
                    // 扣除输入
                    for (int i = 0; i < currentRecipe.inputs.Count; i++)
                    {
                        var ing = currentRecipe.inputs[i];
                        containerInventory.itemSlotList[i].amount -= ing.amount;
                    }
                    // 增加输出
                    for (int i = 0; i < currentRecipe.outputs.Count; i++)
                    {
                        var prod = currentRecipe.outputs[i];
                        containerInventory.itemSlotList[currentRecipe.inputs.Count + i].amount += prod.amount;
                    }
                    craftTimer = 0f;
                }
            }
            else
            {
                craftTimer = 0f;
            }
        }

        //制造建筑的输出逻辑
        if (isMaker && (outputBuildings.Count > 0) && Time.time - lastOutputTime >= outputInterval)
        {
            Debug.Log("1");
            TryOutputProducts();
        }
    }

    #region 制造器逻辑

    bool CanCraft()
    {
        // 检查输入
        for (int i = 0; i < currentRecipe.inputs.Count; i++)
        {
            var ing = currentRecipe.inputs[i];
            var slot = containerInventory.itemSlotList[i];
            if (slot.amount < ing.amount || slot.slotItem != ing.item)
                return false;
        }
        // 检查输出格是否有空位
        for (int i = 0; i < currentRecipe.outputs.Count; i++)
        {
            var prod = currentRecipe.outputs[i];
            var slot = containerInventory.itemSlotList[currentRecipe.inputs.Count + i];
            // 你可以加最大堆叠判断，这里假设无限堆叠
            if (slot.amount + prod.amount > prod.item.maxStack)
                return false;
        }
        return true;
    }

    public bool TryAddInputItem(Item item, int amount)
    {
        // 只允许加到输入格
        for (int i = 0; i < currentRecipe.inputs.Count; i++)
        {
            if (containerInventory.itemSlotList[i].slotItem == item)
            {
                containerInventory.itemSlotList[i].amount += amount;
                return true;
            }
        }
        return false; // 不是输入材料或没找到
    }

    void InitSlotsByRecipe()
    {
        containerInventory.itemSlotList.Clear();

        currentRecipe = InventoryManager.instance.allRecipes[0];
        
        if (currentRecipe == null) return;

        //选择一个默认配方先
        

        // 输入格
        foreach (var ing in currentRecipe.inputs)
            containerInventory.itemSlotList.Add(new ItemSlotInfo(ing.item, 0,true));
        // 输出格
        foreach (var prod in currentRecipe.outputs)
            containerInventory.itemSlotList.Add(new ItemSlotInfo(prod.item, 0, true));
    }

    void TryOutputProducts()
    {
        for (int i = 0; i < currentRecipe.outputs.Count; i++)
        {
            var slot = containerInventory.itemSlotList[currentRecipe.inputs.Count + i];
            if (slot.amount > 0)
            {
                foreach (var building in outputBuildings)
                {
                    if (building != null && building.GetComponent<Building>().Type == BuildingType.Conveyor)
                    {
                        bool success = TryOutPutToBuilding(building, slot);
                        if (success)
                        {
                            slot.amount -= 1;
                            if (slot.amount < 0) slot.amount = 0;
                        }
                    }
                }
            }
        }
        lastOutputTime = Time.time;
    }

    #endregion

    #region 容器逻辑

    private void TryOutPutItem()
    {
        //找到容器中最后一个有物品的格子（Linq）
        ItemSlotInfo slotToOutput = containerInventory.itemSlotList.LastOrDefault(slot => slot.slotItem != null && slot.amount > 0);

        if (slotToOutput == null)
        {
            //没有可输出的物品
            return;
        }

        //尝试将物品输出到每个连接的输出建筑
        foreach (var building in outputBuildings)
        {
            if (building != null && building.GetComponent<Building>().Type == BuildingType.Conveyor)//如果输出建筑是传送带
            {
                bool success = TryOutPutToBuilding(building, slotToOutput);
                if (success)
                {
                    //成功输出物品，更新格子信息
                    slotToOutput.amount -= 1;
                    if (slotToOutput.amount <= 0)
                    {
                        RemoveItem(slotToOutput);
                    }

                }
            }
            //可以在这里添加其他类型的输出建筑处理逻辑
        }
        lastOutputTime = Time.time;//一次输出一轮 

    }

    private bool TryOutPutToBuilding(GameObject building, ItemSlotInfo slotInfo)
    {
        //获取传送带的Manager(管理运输物品的间隔等)
        ConveyorManager manager = building.GetComponent<ConveyorManager>();

        //获取物品预制体
        GameObject itemPrefab = slotInfo.slotItem.itemPrefab;
        if (itemPrefab == null)
        {
            Debug.LogWarning("物品预制体未设置");
            return false;
        }
        if (manager.CanAddItem())
        {
            //将物品生成到传送带的起点位置，及子物体Connector中的Start这个Connector的位置
            Transform startTransform = building.transform.Find("Connectors/Start");
            Transform containerTransform = building.transform.Find("Container");

            GameObject itemInstance = Instantiate(itemPrefab, startTransform.position, Quaternion.identity, containerTransform);//将物品实例化为Container的子物体

            //确保物品有SplineFollower组件
            SplineFollower follower = itemInstance.GetComponent<SplineFollower>();
            if (follower == null)
            {
                follower = itemInstance.AddComponent<SplineFollower>();
            }

            //将follower添加到传送带的管理器中
            manager.AddFollower(follower);

            return true;

        }
        return false;

    }

    public void RemoveItem(ItemSlotInfo slotInfo)
    {
        slotInfo.slotItem = null;
        slotInfo.amount = 0;
    }



    public void AddInputBuilding(GameObject building)
    {
        if (!inputBuildings.Contains(building))
        {
            inputBuildings.Add(building);
        }
    }

    //接下来需要些容器的输出逻辑，例如连接了传送带后，传送带可以从容器中取出物品

    public void AddOutputBuilding(GameObject building)
    {
        if (!outputBuildings.Contains(building))
        {
            outputBuildings.Add(building);
        }
    }
    #endregion


}


