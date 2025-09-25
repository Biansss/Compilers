#include <stdio.h>

// Define a constant for our factorial calculation
#define NUMBER 5

int main() {
    int n = NUMBER;
    int result = 1;

    // A simple loop to calculate the factorial
    for (int i = 1; i <= n; ++i) {
        result *= i;
    }

    printf("The factorial of %d is %d\n", n, result);
    
    return 0;
}
