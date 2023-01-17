!--------------------------------------------------------- 
! Compile and run with:
!   > gfortran justNewton.f90 -o newt
!   > ./newt
!--------------------------------------------------------- 
! Newton's method to study the convergence of a 
! function that does not have an analytical solution.
! Takes two random points for input (cannot be eq.) and
! estimates the point where the function crossses the 
! x-axis. 
!--------------------------------------------------------- 
program NewtonsMethod
    implicit none
    real(8)     :: epsilon, x, f, df, xold
    integer(8)  :: count
    
    call newton(epsilon, x, f, df, xold, count)
    print *, 'n = ',count
    print *, 'x = ',x
    
end program NewtonsMethod
    
subroutine newton(epsilon, x, f, df, xold, count)
    implicit none
    real(8), parameter  :: pi = 4.D0*atan(1.D0)
    real(8)             :: epsilon, x, f, df, xold, dif
    integer(8)          :: count
    
    epsilon = 10.D0**(-15)
    x       = 2.D0    ! two initial guesses where x .ne. xvana
    xold    = 0.D0
    dif     = abs(x - xold)
    count 	= 0
    write (*,7) 
    write (*,8) x
    write (*,9) epsilon
    do while (abs(x-xold) >= epsilon)
        xold    = x
        count	= count + 1
        f 		= 2.D0*x + 2.D0 - exp(x)
        df	    = 2.D0 - exp(x)
        x	    = x - f/df		!Lõikajate meetod
        dif     = abs(x - xold)
        !print *, 'x(',count,') =', x
        write (*,10) count, x, count, count-1, dif
    end do
    
7   format ('========================================================',/,&
            "=               Newton's Iteration Method              =",/,&
            '========================================================')

8   format ('Initial values and accuracy:',/,'x(0)    = ',1f6.3)
9   format ('epsilon =  ', e9.3,/,/,'Results:')
!9   format ('count    x                |x(i+1)-x(i)|')
!10  format ('x(',I1,') =', 6f14.8)
10  format ('x(',I1,') =', f15.8, '    |x(',I1,')-x(',I1,')| = |',e14.8,'|')
    !print *, 'x =', x
    !print *, 'n =', count
end subroutine newton