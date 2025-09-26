; --- 模块元信息 (Module Metadata) ---
source_filename = "fibonacci.ll"
target triple = "x86_64-pc-linux-gnu"

; --- 全局常量定义 (Global Constant Definition) ---
; 对应 C 代码: const int N = 5;
; @N 是全局变量名, `private` 表示只在当前模块可见, `constant` 表明其值不可修改。
; `dso_local` 是动态共享对象本地链接的意思。
@N = private constant i32 5, align 4

; --- 外部函数声明 (External Function Declarations) ---
declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)

; --- 函数声明与定义 (Function Declarations and Definitions) ---

; 递归函数 factorial 的定义
; 接受一个 i32 参数 %n, 返回一个 i32
define dso_local i32 @factorial(i32 %n) {
entry:
  ; 对应 C 代码: if (n <= 1)
  ; `icmp sle` 比较 %n 是否小于或等于 1
  %ifcond = icmp sle i32 %n, 1
  ; 根据比较结果，条件跳转到 if.then 或 if.else 块
  br i1 %ifcond, label %if.then, label %if.else

if.then:                                          ; 递归终止条件
  ; 对应 C 代码: return 1;
  ret i32 1

if.else:                                          ; 递归执行
  ; 对应 C 代码: n * factorial(n - 1)
  ; 1. 计算 n - 1
  %sub = sub nsw i32 %n, 1
  ; 2. 递归调用 factorial(n - 1)
  %call = call i32 @factorial(i32 %sub)
  ; 3. 计算 n * (递归返回值)
  %mul = mul nsw i32 %n, %call
  ; 4. 返回结果
  ret i32 %mul
}

; 主函数 main 的定义框架
; 不接受参数, 返回一个 i32
define dso_local i32 @main() {
entry:
  ; --- 变量内存分配 ---
  %a_ptr = alloca i32, align 4
  %b_ptr = alloca i32, align 4
  %c_ptr = alloca i32, align 4
  %sum_ptr = alloca i32, align 4
  %i_ptr = alloca i32, align 4
  %j_ptr = alloca i32, align 4
  %arr_ptr = alloca [5 x i32], align 16
  %mat_ptr = alloca [2 x [3 x i32]], align 16
  %f5_ptr = alloca i32, align 4
  %res_ptr = alloca i32, align 4
  %M_ptr = alloca i32, align 4

  ; --- 基本变量与数值运算 ---
  ; 对应 C 代码: a = getint(); b = 3;
  %a_input = call i32 @getint()
  store i32 %a_input, i32* %a_ptr, align 4
  store i32 3, i32* %b_ptr, align 4
    %a_val_print = load i32, i32* %a_ptr, align 4
  call void @putint(i32 %a_val_print)
  call void @putch(i32 10)

  ; 对应 C 代码: c = a + b * 2 - (a / b) % 2;
  %a1 = load i32, i32* %a_ptr, align 4
  %b1 = load i32, i32* %b_ptr, align 4
  %mul1 = mul nsw i32 %b1, 2
  %add1 = add nsw i32 %a1, %mul1
  %a2 = load i32, i32* %a_ptr, align 4
  %b2 = load i32, i32* %b_ptr, align 4
  %div1 = sdiv i32 %a2, %b2
  %rem1 = srem i32 %div1, 2
  %sub1 = sub nsw i32 %add1, %rem1
  store i32 %sub1, i32* %c_ptr, align 4
  %c_val_print1 = load i32, i32* %c_ptr, align 4
  call void @putint(i32 %c_val_print1)
  call void @putch(i32 10)

  ; 对应 C 代码: c = c << 1;
  %c1 = load i32, i32* %c_ptr, align 4
  %shl1 = shl i32 %c1, 1
  store i32 %shl1, i32* %c_ptr, align 4
  %c_val_print2 = load i32, i32* %c_ptr, align 4
  call void @putint(i32 %c_val_print2)
  call void @putch(i32 10)

  ; 对应 C 代码: c = c | 5;
  %c2 = load i32, i32* %c_ptr, align 4
  %or1 = or i32 %c2, 5
  store i32 %or1, i32* %c_ptr, align 4
  %c_val_print3 = load i32, i32* %c_ptr, align 4
  call void @putint(i32 %c_val_print3)
  call void @putch(i32 10)

  ; 对应 C 代码: c = c & 7;
  %c3 = load i32, i32* %c_ptr, align 4
  %and1 = and i32 %c3, 7
  store i32 %and1, i32* %c_ptr, align 4
  %c_val_print4 = load i32, i32* %c_ptr, align 4
  call void @putint(i32 %c_val_print4)
  call void @putch(i32 10)

  ; 对应 C 代码: c = ~c;  (等价于 c = c XOR -1)
  %c4 = load i32, i32* %c_ptr, align 4
  %xor1 = xor i32 %c4, -1
  store i32 %xor1, i32* %c_ptr, align 4
  %c_val_print5 = load i32, i32* %c_ptr, align 4
  call void @putint(i32 %c_val_print5)
  call void @putch(i32 10)

  ; --- 条件与短路求值 ---
  ; 对应 C 代码: if (a > b && b > 0 || a == 0)
  ; 首先检查第一个条件: a > b
  %a3 = load i32, i32* %a_ptr, align 4
  %b3 = load i32, i32* %b_ptr, align 4
  %cmp_gt = icmp sgt i32 %a3, %b3
  br i1 %cmp_gt, label %cond_and, label %cond_or

cond_and: ; a > b 为真，检查 b > 0
  %b4 = load i32, i32* %b_ptr, align 4
  %cmp_gt_0 = icmp sgt i32 %b4, 0
  ; 如果 b > 0 也为真，则整个 && 为真，||也为真，直接跳到 if.then
  ; 如果 b > 0 为假，则 && 为假，需要继续检查 || 后面的条件
  br i1 %cmp_gt_0, label %if.then, label %cond_or

cond_or:  ; a > b 为假，或者 (a > b 为真但 b > 0 为假)，检查 a == 0
  %a4 = load i32, i32* %a_ptr, align 4
  %cmp_eq_0 = icmp eq i32 %a4, 0
  br i1 %cmp_eq_0, label %if.then, label %if.else

if.then:  ; 条件为真
  store i32 42, i32* %c_ptr, align 4
  br label %if.end

if.else:  ; 条件为假
  store i32 -1, i32* %c_ptr, align 4
  br label %if.end

if.end:   ; if-else 语句的汇合点
  %c_val_print6 = load i32, i32* %c_ptr, align 4
  call void @putint(i32 %c_val_print6)
  call void @putch(i32 10)

  ; --- for 循环 ---
  ; 初始化 sum = 0; i = 0;
  store i32 0, i32* %sum_ptr, align 4
  store i32 0, i32* %i_ptr, align 4
  br label %for.cond

for.cond: ; for ( ...; i < N; ... )
  %i_val1 = load i32, i32* %i_ptr, align 4
  %N_val1 = load i32, i32* @N, align 4
  %cmp_for = icmp slt i32 %i_val1, %N_val1
  br i1 %cmp_for, label %for.body, label %for.end

for.body: ; for 循环体
  ; if (i == 2) continue;
  %i_val2 = load i32, i32* %i_ptr, align 4
  %cmp_continue = icmp eq i32 %i_val2, 2
  br i1 %cmp_continue, label %for.inc, label %check.break

check.break: ; 检查 break
  ; if (i == 4) break;
  %i_val3 = load i32, i32* %i_ptr, align 4
  %cmp_break = icmp eq i32 %i_val3, 4
  br i1 %cmp_break, label %for.end, label %for.body.logic

for.body.logic: ; 实际的循环逻辑
  ; sum = sum + i;
  %sum_val1 = load i32, i32* %sum_ptr, align 4
  %i_val4 = load i32, i32* %i_ptr, align 4
  %add_sum = add nsw i32 %sum_val1, %i_val4
  store i32 %add_sum, i32* %sum_ptr, align 4
  br label %for.inc

for.inc: ; for ( ...; ...; i = i + 1)
  %i_val5 = load i32, i32* %i_ptr, align 4
  %inc_i = add nsw i32 %i_val5, 1
  store i32 %inc_i, i32* %i_ptr, align 4
  br label %for.cond

for.end:
  %sum_val_print1 = load i32, i32* %sum_ptr, align 4
  call void @putint(i32 %sum_val_print1)
  call void @putch(i32 10)

  ; --- while 循环 ---
  ; 初始化 j = 0;
  store i32 0, i32* %j_ptr, align 4
  br label %while.cond

while.cond: ; while (j < 3)
  %j_val1 = load i32, i32* %j_ptr, align 4
  %cmp_while = icmp slt i32 %j_val1, 3
  br i1 %cmp_while, label %while.body, label %while.end

while.body: ; while 循环体
  ; sum = sum + j;
  %sum_val2 = load i32, i32* %sum_ptr, align 4
  %j_val2 = load i32, i32* %j_ptr, align 4
  %add_sum2 = add nsw i32 %sum_val2, %j_val2
  store i32 %add_sum2, i32* %sum_ptr, align 4
  ; j = j + 1;
  %j_val3 = load i32, i32* %j_ptr, align 4
  %inc_j = add nsw i32 %j_val3, 1
  store i32 %inc_j, i32* %j_ptr, align 4
  br label %while.cond

while.end:
  %sum_val_print2 = load i32, i32* %sum_ptr, align 4
  call void @putint(i32 %sum_val_print2)
  call void @putch(i32 10)

  ; --- 数组操作 ---
  ; 对应 C 代码: for (int i = 0; i < N; i = i + 1) { arr[i] = i * i; }
  store i32 0, i32* %i_ptr, align 4 ; 重置 i = 0
  br label %arr.for.cond

arr.for.cond:
  %i_arr = load i32, i32* %i_ptr, align 4
  %N_arr = load i32, i32* @N, align 4
  %cmp_arr = icmp slt i32 %i_arr, %N_arr
  br i1 %cmp_arr, label %arr.for.body, label %arr.for.end

arr.for.body:
  %i_val_sq = load i32, i32* %i_ptr, align 4
  %i_sq = mul nsw i32 %i_val_sq, %i_val_sq ; i*i
  %i_idx = load i32, i32* %i_ptr, align 4
  ; 计算 arr[i] 的地址
  %arr_elem_ptr = getelementptr inbounds [5 x i32], [5 x i32]* %arr_ptr, i64 0, i32 %i_idx
  store i32 %i_sq, i32* %arr_elem_ptr, align 4
  %arr_val_print = load i32, i32* %arr_elem_ptr, align 4
  call void @putint(i32 %arr_val_print)
  call void @putch(i32 10)
  br label %arr.for.inc

arr.for.inc:
  %i_val_inc = load i32, i32* %i_ptr, align 4
  %i_new = add nsw i32 %i_val_inc, 1
  store i32 %i_new, i32* %i_ptr, align 4
  br label %arr.for.cond

arr.for.end:
  ; 对应 C 代码: for (int i = 0; i < 2; ...) for (int k = 0; k < 3; ...) mat[i][k] = i+k;
  store i32 0, i32* %i_ptr, align 4 ; 重置 i = 0
  br label %mat.for1.cond

mat.for1.cond: ; 外层循环
  %i_mat = load i32, i32* %i_ptr, align 4
  %cmp_mat1 = icmp slt i32 %i_mat, 2
  br i1 %cmp_mat1, label %mat.for1.body, label %mat.for1.end

mat.for1.body:
  store i32 0, i32* %j_ptr, align 4 ; 初始化内层循环变量 k (借用j_ptr)
  br label %mat.for2.cond

mat.for2.cond: ; 内层循环
  %k_mat = load i32, i32* %j_ptr, align 4
  %cmp_mat2 = icmp slt i32 %k_mat, 3
  br i1 %cmp_mat2, label %mat.for2.body, label %mat.for1.inc

mat.for2.body:
  %i_val_mat = load i32, i32* %i_ptr, align 4
  %k_val_mat = load i32, i32* %j_ptr, align 4
  %add_mat = add nsw i32 %i_val_mat, %k_val_mat ; i+k
  ; 计算 mat[i][k] 的地址
  %mat_elem_ptr = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %mat_ptr, i64 0, i32 %i_val_mat, i32 %k_val_mat
  store i32 %add_mat, i32* %mat_elem_ptr, align 4
  %mat_val_print = load i32, i32* %mat_elem_ptr, align 4
  call void @putint(i32 %mat_val_print)
  call void @putch(i32 10)
  br label %mat.for2.inc

mat.for2.inc:
  %k_val_inc = load i32, i32* %j_ptr, align 4
  %k_new = add nsw i32 %k_val_inc, 1
  store i32 %k_new, i32* %j_ptr, align 4
  br label %mat.for2.cond

mat.for1.inc:
  %i_val_inc2 = load i32, i32* %i_ptr, align 4
  %i_new2 = add nsw i32 %i_val_inc2, 1
  store i32 %i_new2, i32* %i_ptr, align 4
  br label %mat.for1.cond

mat.for1.end:
  ; --- 函数调用与最终计算 ---
  ; 对应 C 代码: int f5 = factorial(N);
  %N_final = load i32, i32* @N, align 4
  %f5_val = call i32 @factorial(i32 %N_final)
  store i32 %f5_val, i32* %f5_ptr, align 4
  %f5_val_print = load i32, i32* %f5_ptr, align 4
  call void @putint(i32 %f5_val_print)
  call void @putch(i32 10)
  
  ; 对应 C 代码: const int M = 2;
  store i32 2, i32* %M_ptr, align 4

  ; 对应 C 代码: int res = arr[M] + mat[1][2] + sum + f5;
  ; 1. 加载 arr[M] (即 arr[2])
  %M_val = load i32, i32* %M_ptr, align 4
  %arr_M_ptr = getelementptr inbounds [5 x i32], [5 x i32]* %arr_ptr, i64 0, i32 %M_val
  %arr_M_val = load i32, i32* %arr_M_ptr, align 4
  
  ; 2. 加载 mat[1][2]
  %mat_1_2_ptr = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %mat_ptr, i64 0, i32 1, i32 2
  %mat_1_2_val = load i32, i32* %mat_1_2_ptr, align 4
  
  ; 3. 加载 sum
  %sum_final = load i32, i32* %sum_ptr, align 4
  
  ; 4. 加载 f5
  %f5_final = load i32, i32* %f5_ptr, align 4

  ; 5. 连加
  %add_res1 = add nsw i32 %arr_M_val, %mat_1_2_val
  %add_res2 = add nsw i32 %add_res1, %sum_final
  %add_res3 = add nsw i32 %add_res2, %f5_final
  store i32 %add_res3, i32* %res_ptr, align 4
  
  ; --- 输出最终结果 ---
  %res_final = load i32, i32* %res_ptr, align 4
  call void @putint(i32 %res_final)
  call void @putch(i32 10)

  ; --- 返回 0 ---
  ret i32 0
}