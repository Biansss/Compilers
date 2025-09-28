// 包含SysY库函数声明
int getint();
void putint(int);
void putch(int);

const int N = 5;

int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

int main() {
    int a, b = 3, c;
    a = getint(); 
    putint(a); putch(10); 
    
    // ---------- 基本变量与数值运算 ----------
    c = a + b * 2 - (a / b) % 2;
    putint(c); putch(10); 
    c = c << 1;
    putint(c); putch(10); 
    c = c | 5;
    putint(c); putch(10); 
    c = c & 7;
    putint(c); putch(10); 
    c = ~c;
    putint(c); putch(10); 
    
    // ---------- 条件与短路求值 ----------
    if (a > b && b > 0 || a == 0) {
        c = 42;
    } else {
        c = -1;
    }
    putint(c); putch(10); 
    
    // ---------- 循环与控制流 ----------
    int sum = 0;
    for (int i = 0; i < N; i = i + 1) {
        if (i == 2) continue;
        if (i == 4) break;
        sum = sum + i;
    }
    putint(sum); putch(10); 
    int j = 0;
    while (j < 3) {
        sum = sum + j;
        j = j + 1;
    }
    putint(sum); putch(10); 
    // ---------- 数组操作 ----------
    int arr[5];
    int mat[2][3];
    for (int i = 0; i < N; i = i + 1) {
        arr[i] = i * i;
        putint(arr[i]); putch(10); 
    }
    for (int i = 0; i < 2; i = i + 1) {
        for (int k = 0; k < 3; k = k + 1) {
            mat[i][k] = i + k;
            putint(mat[i][k]); putch(10); 
        }
    }
    
    // ---------- 函数调用与最终计算 ----------
    int f5 = factorial(N);
    putint(f5); putch(10); 
    const int M = 2;
    int res = arr[M] + mat[1][2] + sum + f5;
    putint(res); putch(10); 

    return 0;
}