/*
    gcc -o ca4 c_A4.c  -lgsl -lgslcblas -lm
    ./ca4 
*/
#include <stdio.h>
#include <gsl/gsl_linalg.h>

int main(void)
{
    // Initialize the matrix A and vectors x and b
    size_t n = 201;
    // Matrix A has dimensions MxN
    int M = 200;
    int N = 200;

    // Right-hand side vector B has dimension M
    int NRHS = 1;

    // Declare arrays to hold the matrix A and vector B
    double AA[M*N];
    double B[M];

    double h = 2.0/n;
    double x[M+1];
    double A[M+1][N+1];
    double y[M+1];
    double u[M+1];

    for (int i = 0; i <= n; i++)
    {
        x[i] = i*h;
        A[i][i] = 0;
        y[i] = 0;
    }
    A[0][0] = 1.0/h + h/2*(4-x[0]);
    A[0][1] = -1.0/h;
    y[0] = h/2*(x[0]+5) - 1;

    for (int i = 1; i < N; i++)
    {
        A[i][i-1] = -1.0/h;
        A[i][i]   =  2.0/h + h*(4-x[i]);
        A[i][i+1] = -1.0/h;
        y[i]     = h*(x[i]+5);
    }

    A[N][N-1]   = -1.0/h;
    A[N][N] = 1.0/h + h/2*(4-x[N]);
    y[N]     = h/2*(x[N]+5) - 1;

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

    gsl_matrix_view a = gsl_matrix_view_array(AA, n, n);
    gsl_vector_view xx = gsl_vector_view_array(u, n);
    gsl_vector_view b = gsl_vector_view_array(y, n);

    // Allocate a workspace for the linear solver
    gsl_permutation * p = gsl_permutation_alloc(n);
    int signum;
    gsl_linalg_LU_decomp(&a.matrix, p, &signum);

    // Solve the system of linear equations
    gsl_linalg_LU_solve(&a.matrix, p, &b.vector, &xx.vector);

    // Print the solution
    printf("Solution: \n");
    for (size_t i = 0; i < n; i++)
    {
        printf("x[%d] = %f\n", i, gsl_vector_get(&xx.vector, i));
    }

    // Free the workspace
    gsl_permutation_free(p);

    return 0;
}
