using UnityEngine;

public class PlanetRotation : MonoBehaviour
{
    [Header("自转设置")]
    public float rotationSpeed = 10f; // 旋转速度（度/秒）

    void Update()
    {
        // 绕 Z 轴旋转
        transform.Rotate(0, 0, rotationSpeed * Time.deltaTime, Space.Self);
    }
}
