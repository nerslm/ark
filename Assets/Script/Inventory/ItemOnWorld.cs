using UnityEngine;

public class ItemOnWorld : MonoBehaviour
{
    public Item thisItem;
    public int amount = 1;

    
#if UNITY_EDITOR 
    void OnValidate()// 当脚本在编辑器中被加载或值被更改时调用
    {
        if (thisItem != null && thisItem.itemPrefab == null)
        {
            thisItem.itemPrefab = gameObject;
            UnityEditor.EditorUtility.SetDirty(thisItem); // 标记为已修改，方便保存
        }
    }
#endif
}
