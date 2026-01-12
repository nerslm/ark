using Unity.Mathematics;
using UnityEngine;

public class SplineFollower : MonoBehaviour
{
    //根据时间确定物体在样条曲线上的位置
    [SerializeField]
    [Range(0f, 1f)]
    private float nowtime;//时间从0开始，表示物体在传送带的末端
    private ConveyorSpline conveyorSpline;

    public GameObject EndObj;//终点时自动为物体添加一个item
    
    private ConveyorManager currentConveyorManager;

    public float realSpeed = 10f;

    public float GetTime()
    {
        return nowtime;
    }
    void Start()
    {
        nowtime = 0f;
        Transform container = transform.parent;
        Transform building = container.parent;
        Transform model = building.Find("Model");
        conveyorSpline = building.GetComponentInChildren<ConveyorSpline>();

        //注册到管理器
        currentConveyorManager = building.GetComponent<ConveyorManager>();
        currentConveyorManager.AddFollower(this);
    }

    void Update()
    {
        bool canMove = currentConveyorManager.CanItemMove(this)|| currentConveyorManager == null;//如果管理器为空则不检查，避免报错,此外物品的衔接需要优化，在传送带交界处可能发生重叠，办法1，让上一个传送带物品检测到下一个传送带物品位置停留在该停的地方，2将连接处的传送带做成一个整体，时间改成0-1，这需要在传送带连接时添加逻辑
        if (canMove && nowtime<1f)
        {
            nowtime += (realSpeed / conveyorSpline.Length) * Time.deltaTime;
        }

        if (nowtime >= 1f)
        {
            Container parentContainer = transform.parent.GetComponent<Container>();
            if (parentContainer != null && parentContainer.outputBuildings.Count > 0)//确保容器有输出建筑
            {
                EndObj = parentContainer.outputBuildings[0];//因为传送带只能连接一个输出建筑
            }
            else
            {
                return;//让物体停在传送带末端
            }

            if (EndObj != null)
            {
                Transform containerTransform = EndObj.transform.Find("Container");
                Container endContainer = containerTransform.GetComponent<Container>();
                if (endContainer != null && EndObj.GetComponent<Building>().Type == BuildingType.Conveyor)//下一个物体是传送的则移动到下一个传送带上
                {
                    //检查下一个传送带是否有足够空间放置新物品
                    ConveyorManager nextConveyorManager = EndObj.GetComponent<ConveyorManager>();
                    if (nextConveyorManager.CanAddItem())
                    {
                        //从当前传送带管理器中移除
                        currentConveyorManager.RemoveFollower(this);
                        //将物体移动到下一个传送带
                        transform.SetParent(containerTransform);
                        //重置时间和曲线
                        nowtime = 0f;
                        conveyorSpline = EndObj.GetComponentInChildren<ConveyorSpline>();
                        //注册到新的传送带管理器
                        currentConveyorManager = nextConveyorManager;
                        currentConveyorManager.AddFollower(this);
                        //EndObj =  //变成下一个物体的EndObj

                    }
                    //如果下一个传送带没有足够空间则停在当前传送带末端

                }
                else if (endContainer != null && EndObj.GetComponent<Building>().Type == BuildingType.Container)
                {
                    //移动到容器中，预制物品需要加上ItemOnWorld组件,里面有物品信息
                    ItemOnWorld itemOnWorld = gameObject.GetComponent<ItemOnWorld>();
                    if (itemOnWorld != null)
                    {
                        int remaining;
                        if (endContainer.isMaker)//如果是制造建筑则添加到制造建筑的输入格中
                        {
                            remaining = InventoryManager.instance.AddItemToMaker(itemOnWorld.thisItem.itemName, itemOnWorld.amount, endContainer);
                        }
                        else//如果是普通容器则添加到容器的库存中
                        {
                            remaining = InventoryManager.instance.AddItem(itemOnWorld.thisItem.itemName, itemOnWorld.amount, endContainer.containerInventory);
                        }

                        if (remaining == 0)
                        {
                            //成功添加物品，销毁物体
                            if (currentConveyorManager != null)
                            {
                                currentConveyorManager.RemoveFollower(this);
                            }
                            Destroy(gameObject);
                        }
                        else
                        {
                            //传送带上默认物品数量为1，所以不会走到只能是一个空都没有的情况
                            Debug.Log("容器空间不足，无法完全添加物品，剩余数量：" + remaining);
                        }
                    }
                    else
                    {
                        //无法识别物品
                        Debug.LogWarning("物体上缺少ItemOnWorld组件，无法识别物品");
                        return;
                    }


                }
            }
            return;
        }

        conveyorSpline.Evaluate(nowtime, out float3 position, out float3 forward, out float3 up);
        transform.position = position;
        transform.rotation = Quaternion.LookRotation(forward, up);



    }


}
