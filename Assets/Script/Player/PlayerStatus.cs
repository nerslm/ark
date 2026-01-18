using UnityEngine;
using UnityEngine.UI;
using KinematicCharacterController.Examples;
//作为玩家状态管理的脚本，负责处理生命值、氧气、食物和水分等状态的变化，以及是否穿着有特殊效果的装备，磁力鞋等等
public class PlayerStatus : MonoBehaviour
{
    [Header("===== 最大值设置 =====")]
    public float maxHealth = 100f;
    public float maxOxygen = 100f;
    public float maxFood = 100f;
    public float maxWater = 100f;

    [Header("===== 衰减速度（每秒）=====")]
    public float oxygenDecayRate = 2f;
    public float foodDecayRate = 0.5f;
    public float waterDecayRate = 0.8f;

    [Header("===== UI绑定（把Slider拖到这里）=====")]
    public Slider healthSlider;
    public Slider oxygenSlider;
    public Slider foodSlider;
    public Slider waterSlider;

    public MonoBehaviour deathScreen;

    [Header("=====装备状态=====")]

    // ==================== 私有字段 ====================
    private float _currentHealth;
    private float _currentOxygen;
    private float _currentFood;
    private float _currentWater;

    private bool _isDead = false;

    [Header("=====装备状态所需的外部引用=====")]

    public ExampleCharacterController characterController;

    // ==================== 属性（自动更新UI）====================

    public float CurrentHealth
    {
        get { return _currentHealth; }
        set
        {
            _currentHealth = Mathf.Clamp(value, 0, maxHealth);
            UpdateSlider(healthSlider, _currentHealth, maxHealth);

            if (_currentHealth <= 0)
            {
                OnPlayerDeath();
            }
        }
    }

    public float CurrentOxygen
    {
        get { return _currentOxygen; }
        set
        {
            _currentOxygen = Mathf.Clamp(value, 0, maxOxygen);
            UpdateSlider(oxygenSlider, _currentOxygen, maxOxygen);

        }
    }

    public float CurrentFood
    {
        get { return _currentFood; }
        set
        {
            _currentFood = Mathf.Clamp(value, 0, maxFood);
            UpdateSlider(foodSlider, _currentFood, maxFood);
        }
    }

    public float CurrentWater
    {
        get { return _currentWater; }
        set
        {
            _currentWater = Mathf.Clamp(value, 0, maxWater);
            UpdateSlider(waterSlider, _currentWater, maxWater);
        }
    }

    // ==================== 生命周期 ====================

    void Start()
    {
        // 初始化所有状态为满值
        CurrentHealth = maxHealth;
        CurrentOxygen = maxOxygen;
        CurrentFood = maxFood;
        CurrentWater = maxWater;
    }

    void Update()
    {
        if (!_isDead)
        {
            // 氧气随时间减少
            CurrentOxygen -= oxygenDecayRate * Time.deltaTime;

            // 如果你之后想让食物和水也衰减，取消下面的注释：
            CurrentFood -= foodDecayRate * Time.deltaTime;
            CurrentWater -= waterDecayRate * Time.deltaTime;

            // 检查状态归零的影响
            CheckStatusEffects();
        }
    }

    // ==================== 核心方法 ====================

    /// <summary>
    /// 更新Slider显示
    /// </summary>
    private void UpdateSlider(Slider slider, float currentValue, float maxValue)
    {
        if (slider != null)
        {
            slider.value = currentValue / maxValue;
        }
    }

    /// <summary>
    /// 检查各状态归零时的影响
    /// </summary>
    private void CheckStatusEffects()
    {
        // 氧气归零 → 持续掉血
        if (_currentOxygen <= 0)
        {
            CurrentHealth -= 10f * Time.deltaTime;
        }

        // 食物归零 → 缓慢掉血
        if (_currentFood <= 0)
        {
            CurrentHealth -= 2f * Time.deltaTime;
        }

        // 水分归零 → 缓慢掉血
        if (_currentWater <= 0)
        {
            CurrentHealth -= 3f * Time.deltaTime;
        }
    }

    /// <summary>
    /// 玩家死亡
    /// </summary>
    private void OnPlayerDeath()
    {
        if (_isDead) return; // 防止重复触发
        _isDead = true;

        Debug.Log("玩家死亡！");

        // 在场景中搜索 KinematicCharacterMotor 组件并禁用
        MonoBehaviour motor = FindObjectOfType(System.Type.GetType("KinematicCharacterController.KinematicCharacterMotor")) as MonoBehaviour;
        if (motor != null)
        {
            motor.enabled = false;
            Debug.Log("已禁用 KinematicCharacterMotor");

            // 启用该物体上的刚体物理，让角色倒下
            Rigidbody rb = motor.GetComponent<Rigidbody>();
            if (rb != null)
            {
                rb.isKinematic = false;
                rb.useGravity = true;

                // 添加一个随机方向的推力，让角色倒下
                Vector3 randomDirection = new Vector3(
                    Random.Range(-1f, 1f),
                    Random.Range(0.2f, 0.5f),
                    Random.Range(-1f, 1f)
                ).normalized;
                rb.AddForce(randomDirection * 1f, ForceMode.Impulse);

                Debug.Log("已启用刚体物理并添加推力");
            }
        }
        else
        {
            Debug.LogWarning("场景中未找到 KinematicCharacterMotor 组件");
        }

        // 显示死亡界面
        if (deathScreen != null)
        {
            deathScreen.enabled = true;
        }
    }

    // ==================== 公共接口（供外部调用）====================

    /// <summary>
    /// 受到伤害
    /// </summary>
    public void TakeDamage(float damage)
    {
        CurrentHealth -= damage;
    }

    /// <summary>
    /// 恢复生命
    /// </summary>
    public void Heal(float amount)
    {
        CurrentHealth += amount;
    }

    /// <summary>
    /// 补充氧气
    /// </summary>
    public void RefillOxygen(float amount)
    {
        CurrentOxygen += amount;
    }

    /// <summary>
    /// 进食
    /// </summary>
    public void Eat(float amount)
    {
        CurrentFood += amount;
    }

    /// <summary>
    /// 喝水
    /// </summary>
    public void Drink(float amount)
    {
        CurrentWater += amount;
    }

    /// <summary>
    /// 使用消耗品（可同时恢复多种状态）
    /// </summary>
    public void UseConsumable(float health = 0, float oxygen = 0, float food = 0, float water = 0)
    {
        if (health != 0) CurrentHealth += health;
        if (oxygen != 0) CurrentOxygen += oxygen;
        if (food != 0) CurrentFood += food;
        if (water != 0) CurrentWater += water;
    }

    // --- 供外部调用的方法：穿装备 ---
    public void EquipItem(ItemData item)
    {
        Debug.Log($"装备了: {item.name}");

        {
            Debug.Log($"装备了: {item.name}");

            // 1. 确保我们要控制的脚本已经赋值
            if (characterController != null)
            {
                // 2. 如果装备是磁力鞋
                if (item.isMagneticBoots)
                {
                    // 【关键修改3】修改 ExampleCharacterController 中的布尔值
                    characterController.magneticBootsEnabled = true;
                    Debug.Log("磁力鞋功能已开启 (ExampleCharacterController)");
                }
            }
            else
            {
                Debug.LogWarning("PlayerStatus: Character Controller 未赋值，无法启用磁力鞋！");
            }
        }

        // 这里可以使用简单的累加，也可以用列表存起来
        // 为了演示简单，我们直接修改属性，或者你可以触发一次“重新计算所有属性”

    }

    // --- 供外部调用的方法：脱装备 ---
    public void UnequipItem(ItemData item)
    {
        Debug.Log($"脱下了: {item.name}");

        if (characterController != null)
        {
            if (item.isMagneticBoots)
            {
                // 【关键修改4】关闭功能
                characterController.magneticBootsEnabled = false;
                Debug.Log("磁力鞋功能已关闭 (ExampleCharacterController)");
            }
        }
        // 这里可以使用简单的累加，也可以用列表存起来
        // 为了演示简单，我们直接修改属性，或者你可以触发一次“重新计算所有属性”

    }
}