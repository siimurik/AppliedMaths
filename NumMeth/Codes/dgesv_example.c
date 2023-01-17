/*
    $gcc dgesv_example.c -o dgesv -llapacke
*/
#include <stdio.h>
#include <lapacke.h>

int main() {
    // Matrix A has dimensions MxN
    int M = 200;
    int N = 200;

    // Right-hand side vector B has dimension M
    int NRHS = 1;

    // Declare arrays to hold the matrix A and vector B
    double AA[M*N];
    double B[M];

    int n = 200;
    double h = 2.0/n;
    double x[M+1];
    double A[M+1][N+1];
    double y[M+1];
    for (int i = 0; i <= n; i++)
    {
        x[i] = i*h;
        A[i][i] = 0;
        y[i] = 0;
    }
    A[0][0] = 1.0/h + h/2*(4-x[0]);
    A[0][1] = -1.0/h;
    y[0] = h/2*(x[0]+5) - 1;

    for (int i = 1; i < n; i++)
    {
        A[i][i-1] = -1.0/h;
        A[i][i]   =  2.0/h + h*(4-x[i]);
        A[i][i+1] = -1.0/h;
        y[i]     = h*(x[i]+5);
    }

    A[n][n-1]   = -1.0/h;
    A[n][n] = 1.0/h + h/2*(4-x[n]);
    y[n]     = h/2*(x[n]+5) - 1;

    // Set the values of A and B
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            AA[i*N + j] = A[i][j];
        }
        B[i] = y[i];
    }

    // Print out the values of A, y, and u
    printf("A:\n");
    for (int i = 0; i <= 5; i++)
    {
        printf("%f ", AA[i]);
    }
    printf("y:\n");
    for (int i = 0; i <= 5; i++)
    {
        printf("%f ", B[i]);
    }

    // Declare array to hold the solution vector X
    double X[N];

    // Declare array to hold the pivot indices
    int pivot[N];

    // Declare variable to hold the status of the solution
    int info;

    // Solve the system of linear equations
    info = LAPACKE_dgesv(LAPACK_ROW_MAJOR, N, NRHS, AA, N, pivot, B, NRHS);

    // Check if the solution was successful
    if (info == 0) {
        // Solution was successful, so X contains the solution
        for (int i = 0; i < N; i++) {
            printf("X[%d] = %f\n", i, X[i]);
        }
    } else {
        // Solution was not successful
        printf("The solution was not successful.\n");
    }

    return 0;
}
