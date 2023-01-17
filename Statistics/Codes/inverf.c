/*
============================================
 Compile and execute with:
    $ gcc inverf.c -o inverf -lm
    $ ./inverf
============================================
*/
#include <stdio.h>
#include <math.h>

int main() {
    double x, result, fx, dfx, dx, xold;
    double tolerance = 1.0e-16;
    double pi = 4.0 * atan(1.0);
    //int max_iterations = 100;
    int iteration, i;

    // input value for x
    printf("Calculator for inverse error function\n");
    printf("Enter the value for x: ");
    scanf("%lf", &x);

    // check the input value is between -1 and 1
    if (x < -1.0 || x > 1.0) {
        printf("Invalid input, x must be between -1 and 1.");
        return 0;
    }

    // initial guess
    result = x;
    xold = 0.0;
    iteration = 0;

    // iterate until the solution converges or maximum iterations reached
    do {
        xold = result;
        fx = erf(result) - x;
        dfx = 2.0 / sqrt(pi) * exp(-pow(result, 2.0));
        dx = fx / dfx;

        // update the solution
        result = result - dx;

        iteration = iteration + 1;
    } while (fabs(result - xold) >= tolerance);

    // output the result
    printf("The inverse error function of %lf is %lf\n", x, result);
    printf("Number of iterations: %d\n", iteration);

    return 0;
}