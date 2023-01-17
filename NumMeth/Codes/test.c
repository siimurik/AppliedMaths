/*
    $ gcc -o test test.c -lgsl -lgslcblas -lm
    $ ./test 
*/
#include <stdio.h>
#include <gsl/gsl_linalg.h>

int main() {
  // Define the coefficient matrix A
  double A_data[] = {1, 2, 3, 4};
  gsl_matrix_view A = gsl_matrix_view_array(A_data, 2, 2);

  // Define the right-hand side vector y
  double y_data[] = {5, 6};
  gsl_vector_view y = gsl_vector_view_array(y_data, 2);

  // Allocate memory for the solution vector x
  gsl_vector *x = gsl_vector_alloc(2);

  // Perform the LU decomposition of the matrix A
  gsl_permutation *p = gsl_permutation_alloc(2);
  int s;
  gsl_linalg_LU_decomp(&A.matrix, p, &s);

  // Solve the system of equations A*x = y
  gsl_linalg_LU_solve(&A.matrix, p, &y.vector, x);

  // Print the solution vector x
  printf("x = \n");
  gsl_vector_fprintf(stdout, x, "%g");

  // Free memory
  gsl_permutation_free(p);
  gsl_vector_free(x);

  return 0;
}
