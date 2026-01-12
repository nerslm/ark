using System.Collections.Generic;
using UnityEngine;

public class ConveyorManager : MonoBehaviour
{
    [SerializeField]
    private List<SplineFollower> itemsOnConveyor = new List<SplineFollower>();
    [SerializeField]
    private float interval = 1f;//物品间隔

    private ConveyorSpline conveyorSpline;

    void Start()
    {
        conveyorSpline = GetComponentInChildren<ConveyorSpline>();
    }

    public bool CanAddItem()
    {
        //检查传送带起始位置是否有足够空间放置新物品
        if (itemsOnConveyor.Count == 0) return true;

        float minTime = 1f;//找到最靠近起点的物体


        foreach (var item in itemsOnConveyor)
        {
            if (item != null && item.GetTime() < minTime)
            {
                minTime = item.GetTime();
            }
        }
        //计算距离是否足够
        float distanceFromStart = minTime * conveyorSpline.Length;
        return distanceFromStart >= interval;
    }
    public void AddFollower(SplineFollower follower)
    {
        if (!itemsOnConveyor.Contains(follower))//wc就是因为没加这个判断才出问题的
        {
            itemsOnConveyor.Add(follower);
        }
    }
    public void RemoveFollower(SplineFollower follower)
    {
        itemsOnConveyor.Remove(follower);
    }
    public bool CanItemMove(SplineFollower follower)
    {
        float currentTime = follower.GetTime();

        foreach (var i in itemsOnConveyor)//这里便利了所有物体，找到了在当前物体前方的物体，每各个物体都检查了距离，后面可以修改
        {
            if(i==null || i==follower)//空引用或自己跳过
            {
                continue;
            }

            float otherTime = i.GetTime();

            if (otherTime > currentTime)//只检查前方的物体
            {
                float distance = (otherTime - currentTime) * conveyorSpline.Length;
                if (distance < interval)
                {
                    return false;//距离不够，不能移动
                }
            }
        }
        return true;
    }

    void Update()
    {
        //清理空引用
        itemsOnConveyor.RemoveAll(item => item == null);   
    }
}
