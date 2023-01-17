!=============================================
! Compile and execute with:
!   $ gfortran invlaperf.f90 -o invlap
!   $ ./invlap
!=============================================
program InverseErrorFunction
  implicit none

    double precision :: x, result, fx, dfx, dx, xold, input
    double precision, parameter :: tolerance = 1.0e-16, pi = 4.D0*atan(1.D0)
    integer :: max_iterations = 100
    integer :: iteration, i

    ! input value for x
    print *, "Calculator for inverse Laplace error function"
    print *, "Enter the value for Φ-1(0 < x < 0.5): "
    read*, input
    x = 2.D0 * input
    ! check the input value is between -1 and 1
    if (x < -1.0 .or. x > 1.0) then
        write(*,*) "Invalid input, x must be between -1 and 1."
        stop
    endif

    ! initial guess
    result = x
    xold = 0.D0
    iteration = 0

    ! iterate until the solution converges or maximum iterations reached
    !do i = 1, max_iterations
    do while (abs(result - xold) >= tolerance)
        xold = result
        fx = erf(result) - x
        dfx = 2.D0 / sqrt(pi) * exp(-result**2.D0)
        dx = fx / dfx

        ! update the solution
        result = result - dx

        iteration = iteration + 1
    end do

    ! output the result
    write (*,*) "The inverse error function of", input, "is", sqrt(2.D0) * result
    write (*,*) "Number of iterations: ", iteration
end program InverseErrorFunction