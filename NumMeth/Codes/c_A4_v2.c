/*
    $ gcc c_A4_v2.c -o galerk
    $ ./galerk 
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
//#include <lapacke.h>

// Solve the problem
// -u''(x) + (4 - x)u(x) = x + 5 , x ∈ (0, 2) ,
// u'(0) = 1, u'(2) = 2,
// by means of the Galerkin finite element method
// where xi = ih, h = 0.01
#define N 200

int main(void)
{
    int n = 200;
    double h = 2.0/n;
    double x[n+1];
    double A[n+1][n+1];
    double y[n+1];
    double u[n+1];

    for (int i = 0; i <= n; i++)
    {
        x[i] = i*h;
        A[i][i] = 0;
        y[i] = 0;
        u[i] = 0;
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

// Perform Gaussian elimination
    for (int i = 0; i < N-1; i++)
    {
        // Find pivot element
        int pivot = i;
        for (int j = i+1; j < N; j++)
        {
            if (fabs(A[j][i]) > fabs(A[pivot][i]))
            {
                pivot = j;
            }
        }

        // Swap rows if necessary
        if (pivot != i)
        {
            for (int j = 0; j < N; j++)
            {
                double temp = A[i][j];
                A[i][j] = A[pivot][j];
                A[pivot][j] = temp;
            }
            double temp = y[i];
            y[i] = y[pivot];
            y[pivot] = temp;
        }

        // Eliminate elements below pivot element
        for (int j = i+1; j < N; j++)
        {
            double factor = A[j][i] / A[i][i];
            for (int k = i+1; k < N; k++)
            {
                A[j][k] -= factor * A[i][k];
            }
            y[j] -= factor * y[i];
        }
    }
    // Solve for variables by back-substitution
    for (int i = N-1; i >= 0; i--)
    {
        u[i] = y[i];
        for (int j = i+1; j < N; j++)
        {
            u[i] -= A[i][j] * u[j];
        }
        u[i] /= A[i][i];
    }

    FILE *fp;
    fp = fopen("output.dat", "w");
    for (int i = 0; i <= n; i++)
    {
        fprintf(fp, "%f %f\n", x[i], u[i]);
    }
    fclose(fp);

    // Print the results
    //printf("Solution: \n");
    //for (int i = 0; i < N; i++)
    //{
    //    printf("u[%d] = %f\n", i, u[i]);
    //}
    return 0;
}
/*
    // Print out the values of A, y, and u
    printf("A:\n");
    for (int i = 0; i <= 5; i++)
    {
        for (int j = 0; j <= 5; j++)
        {
            printf("%f ", A[i][j]);
        }
        printf("\n");
    }
    printf("y:\n");
    for (int i = 0; i <= 5; i++)
    {
        printf("%f ", y[i]);
    }
    printf("\nu:\n");
    for (int i = 0; i <= 5; i++)
    {
        printf("%f ", u[i]);
    }
    printf("\n");

    free(ipiv);
    free(u);
    return 0;
}
*/
/*
    FILE *fp;
    fp = fopen("output.dat", "w");
    for (int i = 0; i <= n; i++)
    {
        fprintf(fp, "%f %f\n", x[i], u[i]);
    }
    fclose(fp);

    // Print out the values of A, y, and u
    printf("A:\n");
    for (int i = 0; i <= 5; i++)
    {
        for (int j = 0; j <= 5; j++)
        {
            printf("%f ", A[i][j]);
        }
        printf("\n");
    }
    printf("y:\n");
    for (int i = 0; i <= 5; i++)
    {
        printf("%f ", y[i]);
    }
    printf("\nu:\n");
    for (int i = 0; i <= 5; i++)
    {
        printf("%f ", u[i]);
    }
    printf("\n");

    return 0;
}
*/