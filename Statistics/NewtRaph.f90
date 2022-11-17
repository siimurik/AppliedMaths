!--------------------------------------------------------- 
! Compile and run with:
!   > gfortran NewtRaph.f90 -o NewtRaph
!   > ./NewtRaph
!--------------------------------------------------------- 
! Newton - Raphson method to study the convergence of a 
! function that does not have an analytical solution.
! Takes two random points for input (cannot be eq.) and
! estimates the point where the function crossses the 
! x-axis. 
!--------------------------------------------------------- 
program NewtRaph
    implicit none
    real(8)     :: epsilon, x, xvana, fx, fxvana, xuus
    integer(8)  :: count
    
    call loikaja(epsilon, x, xvana, fx, fxvana, xuus, count)
    print *, 'n = ',count
    print *, 'x = ',x
    
end program NewtRaph
    
subroutine loikaja(epsilon, x, xvana, fx, fxvana, xuus, count)
    implicit none
    real(8), parameter  :: pi = 4.D0*atan(1.D0)
    real(8)             :: epsilon, x, xvana, fx, fxvana, xuus
    integer(8)          :: count
    
    epsilon = 10.D0**(-8)
    x       = 1.    ! two initial guesses where x .ne. xvana
    xvana 	= 2.    ! two initial guesses where x .ne. xvana
    count 	= 0
    write (*,9) 
    do while (abs(x-xvana) >= epsilon)
        count	= count + 1
        fx		= 2.D0*x + 2.D0 - exp(x)
        fxvana	= 2.D0*xvana + 2.D0 - exp(xvana)
        xuus	= x - fx*(x-xvana)/(fx-fxvana)		!Lõikajate meetod
        xvana	= x
        x		= xuus
        !print *, 'x(',count,') =', x
        write (*,10) count, x, abs(x-xvana)
    end do
    

9   format ('count    x                |x(i+1)-x(i)|')
!10  format ('x(',I1,') =', 6f14.8, '|',e14.8,'|')
10  format ('x(',I1,') =', e15.8, '    |',e14.8,'|')
    !print *, 'x =', x
    !print *, 'n =', count
end subroutine loikaja