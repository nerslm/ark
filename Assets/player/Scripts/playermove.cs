using UnityEngine;
using UnityEngine.InputSystem;

public class playermove : MonoBehaviour
{
    public InputActionAsset inputActions;
    public Transform playerCamera;
    
    private InputAction moveAction;
    private InputAction jumpAction;
    private InputAction lookAction;

    private Vector2 moveInput;
    private Vector2 lookInput;
    private Animator animator;
    private Rigidbody rb;

    public float moveSpeed = 5f;
    public float jumpForce = 5f;
    public float rotateSpeed = 1f;

    private float xRotation = 0f;

    private void OnEnable() //启用后 动作映射中的所有动作都会被实时监控，输入系统更新逻辑时，默认每帧都会执行此操作
    {
        inputActions.FindActionMap("Player").Enable();
    }

    private void OnDisable() //若此角色被关闭或销毁则禁用动作映射
    {
        inputActions.FindActionMap("Player").Disable();
    }

    private void Awake()
    {
        // 获取动作映射
        moveAction = inputActions.FindAction("Move");
        jumpAction = inputActions.FindAction("Jump");
        lookAction = inputActions.FindAction("Look");

        // 获取组件
        animator = GetComponent<Animator>();
        rb = GetComponent<Rigidbody>();


    }

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    private void Start()
    {
        
    }

    // Update is called once per frame
    private void Update()
    {
        moveInput= moveAction.ReadValue<Vector2>();
        lookInput = lookAction.ReadValue<Vector2>();

        if(jumpAction.WasPressedThisFrame()) //IsPressed() 检测按键是否被按下,可多帧运行。WasPressedThisFrame() 检测按键是否在本帧被按下,运行一帧，wasReleasedThisFrame() 检测按键是否在本帧被释放
         
        {
            Jump();
        }
        
        
    }

    private void FixedUpdate()
    {
        Walk();
        //Look();
        
    }

    private void LateUpdate()
    {
        Rotate();
    }

    private void Walk()
    {
        //animator.SetFloat("Speed", moveInput.magnitude); //设置动画参数速度和运动速度匹配
        //rb.MovePosition(rb.position + transform.forward * moveInput.y * moveSpeed * Time.deltaTime);
        Vector3 movement = (transform.forward * moveInput.y + transform.right * moveInput.x).normalized;
        rb.MovePosition(rb.position + movement * moveSpeed * Time.fixedDeltaTime);

    }

    private void Rotate()
    {
        float rotationAmount = lookInput.x * rotateSpeed * Time.deltaTime;
        Quaternion rotation = Quaternion.Euler(0f, rotationAmount, 0f);
        rb.MoveRotation(rb.rotation * rotation); //左右旋转整体

        //layerCamera.Rotate(-lookInput.y * rotateSpeed * Time.deltaTime, 0f, 0f); //摄像机上下旋转
        
        // 1. 计算这一帧想转多少度
        float mouseY = lookInput.y * rotateSpeed * Time.deltaTime;

        // 2. 减去这个度数，并用 Clamp 限制在 -90 到 90 度之间
        xRotation -= mouseY;
        xRotation = Mathf.Clamp(xRotation, -90f, 90f);

        // 3. 把限制好的角度，强行赋值给摄像机
        playerCamera.localRotation = Quaternion.Euler(xRotation, 0f, 0f);
    }

    public void Jump()
    {
        if (Mathf.Abs(rb.linearVelocity.y) < 0.01f) // 检查是否在地面上
        {
            rb.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);
            //还可以加入动画触发器播放动画
        }
    }
}
