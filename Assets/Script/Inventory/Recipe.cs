using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(fileName = "New Recipe", menuName = "Recipe/New Recipe")]
public class Recipe : ScriptableObject
{
    [System.Serializable]
    public struct Ingredient
    {
        public Item item;
        public int amount;
    }
    [System.Serializable]
    public struct Product
    {
        public Item item;
        public int amount;
    }

    public List<Ingredient> inputs;   // 输入材料
    public List<Product> outputs;     // 所有产物（主产物+副产物）
    public float craftTime = 1f;      // 制作时间
}
