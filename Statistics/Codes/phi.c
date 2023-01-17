/*
============================================
 Compile and execute with:
    $ gcc phi.c -o phi -lm
    $ ./phi
============================================
 Fining the values of the
 Laplace error function Φ(x):
        x                 
        ⌠                 
        ⎮           2.0   
        ⎮     -0.5⋅t      
        ⎮ √2⋅ℯ            
Φ(x) =  ⎮ ───────────── dt
        ⎮      2⋅√π       
        ⌡                 
        0
 For this we are using an infinite
 series:
        ∞                
     ______             
     ╲                  
      ╲                 
       ╲            k   
        ╲     ⎛  2 ⎞    
√2⋅x     ╲    ⎜-x  ⎟    
────⋅    ╱    ⎜────⎟    
2⋅√π    ╱     ⎝ 2  ⎠    
       ╱    ────────────
      ╱     (2⋅k + 1)⋅k!
     ╱                  
     ‾‾‾‾‾‾             
     k = 0                    
*/

#include <stdio.h>
#include <math.h>
#include <time.h>

#define pi 4.0*atan(1.0)

int main() {
    double val, x, Phi;
    int i, T1, T2, num;
    //x = 0.5;

    printf("Calculator for Laplace error function\n");
    printf("Enter the value for x: ");
    scanf ("%lf", &x);
    //printf("x = %lf\n", x);

    num = 100;
    val = 0.0;

    // Start the clock
    clock_t start = clock();

    // 
    for (i = 0; i <= num; i++) {
        val = val + pow(-x*x/2.0, i) / ((2.0*i+1.0) * tgamma(i+1));
    }

    // Stop the clock
    clock_t end = clock();

    // Calculate the elapsed time in seconds
    double elapsed_time = (double)(end - start) / CLOCKS_PER_SEC;

    // Results
    Phi = x/sqrt(2.0*pi) * val;
    printf("Estimated Value of Phi: %lf\n", Phi);
    printf("Elapsed time: %5.4e seconds.\n", elapsed_time);
    return 0;
}