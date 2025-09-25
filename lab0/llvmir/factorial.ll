; --- 模块元信息 ---
; ModuleID 标识模块名
; source_filename 记录源文件名
; target triple 指定我们的目标平台为64位Linux系统
; --- Module Metadata ---
; ModuleID identifies the module name.
; source_filename records the source file name.
; target triple specifies our target platform as a 64-bit Linux system.
;
; ModuleID = 'fibonacci.ll'
source_filename = "fibonacci.ll"
target triple = "x86_64-pc-linux-gnu"

; --- SysY 运行时库函数声明 ---
; 用 `declare` 关键字声明本模块需要用到，但在外部库中定义的函数。
; --- SysY Runtime Library Function Declarations ---
; Use the `declare` keyword for functions that this module needs
; but are defined in an external library.

declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)


; --- 主函数定义将在这里添加 ---
; --- Main function definition will be added here ---
define dso_local i32 @main() {

; "entry" 是函数的入口基本块。所有函数都至少有一个基本块。
; "entry" is the entry basic block of the function. All functions have at least one basic block.
entry:
  ; === 变量内存分配 ===
  ; 使用 `alloca` 指令在函数栈帧上为所有局部变量分配空间。
  ; `alloca` 返回一个指向所分配内存的指针。例如, `%a_ptr` 的类型是 i32*。
  ; === Variable Memory Allocation ===
  ; Use the `alloca` instruction to allocate space for all local variables on the function's stack frame.
  ; `alloca` returns a pointer to the allocated memory. For example, the type of `%a_ptr` is i32*.
  %a_ptr = alloca i32, align 4
  %b_ptr = alloca i32, align 4
  %i_ptr = alloca i32, align 4
  %t_ptr = alloca i32, align 4
  %n_ptr = alloca i32, align 4

  ; ... 后续代码将在这里添加 ...
  ; ... Subsequent code will be added here ...

  ; 临时返回语句，以保证IR在语法上是完整的
  ; Temporary return statement to ensure the IR is syntactically complete
  ret i32 0
}