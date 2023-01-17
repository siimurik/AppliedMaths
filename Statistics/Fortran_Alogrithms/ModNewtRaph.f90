!--------------------------------------------------------- 
! Compile and run with:
!   > gfortran ModNewtRaph.f90 -o mnr
!   > ./mnr
!--------------------------------------------------------- 
! Newton - Raphson method to study the convergence of a 
! function that does not have an analytical solution.
! Takes two random points for input (cannot be eq.) and
! estimates the point where the function crossses the 
! x-axis. 
!--------------------------------------------------------- 
program ModNewtRaph
    implicit none
    real(8)     :: epsilon, x, xvana, fx, fxvana, xuus
    integer(8)  :: count
    
    call loikaja(epsilon, x, xvana, fx, fxvana, xuus, count)
    print *, 'n = ',count
    print *, 'x = ',x
    
end program ModNewtRaph
    
subroutine loikaja(epsilon, x, xvana, fx, fxvana, xuus, count)
    implicit none
    real(8), parameter  :: pi = 4.D0*atan(1.D0)
    real(8)             :: epsilon, x, xvana, fx, fxvana, xuus
    integer(8)          :: count
    
    epsilon = 10.D0**(-15)
    x       = 1.D0    ! two initial guesses where x .ne. xvana
    xvana 	= 2.D0    ! two initial guesses where x .ne. xvana
    count 	= 0
    write (*,7) 
    write (*,8) x, xvana
    write (*,9) epsilon
    do while (abs(x-xvana) >= epsilon)
        count	= count + 1
        fx		= 2.D0*x + 2.D0 - exp(x)
        fxvana	= 2.D0*xvana + 2.D0 - exp(xvana)
        xuus	= x - fx*(x-xvana)/(fx-fxvana)		!Lõikajate meetod
        xvana	= x
        x		= xuus
        !print *, 'x(',count,') =', x
        write (*,10) count, x, count, count-1, abs(x-xvana)
    end do
    
7   format ('========================================================',/,&
            '=       Modified Newton-Rhapson Iteration Method       =',/,&
            '========================================================')

8   format ('Initial values and accuracy:',/,'x(0) = ',1f5.2, ', x(-1) = ',1f5.2)
9   format ('epsilon =    ', e14.3,/,/,'Results:')
!10  format ('x(',I1,') =', 6f14.8, '|',e14.8,'|')
10  format ('x(',I1,') =', f15.8, '    |x(',I1,')-x(',I1,')| = |',e14.8,'|')
    !print *, 'x =', x
    !print *, 'n =', count
end subroutine loikaja