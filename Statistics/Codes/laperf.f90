!-------------------------------------------------------------------------
! Compile and execute with:
!   > gfortran laperf.f90 -o laperf
!   >./laperf 
!-------------------------------------------------------------------------
program LaplaceErrorFunction
    implicit none
    double precision    :: val, MFLOPS, x, Phi
    integer  		:: i, T1, T2, num
    double precision, parameter  :: pi = 4.D0*atan(1.D0)
!-------------------------------------------------------------------------
! Input for Phi function:
    !x = 0.5D0
    print *, "Input x: "
    read *, x
!-------------------------------------------------------------------------
! Lenght of series and starting value:
    num = 100
    val = 0.D0
!-------------------------------------------------------------------------
! Calculating the series
    call system_clock(T1)       ! get time stamp
    do i = 0, num
        val = val + (-x**2.D0/2.D0)**i/((2.D0*i+1.D0)*gamma(real(i)+1.D0))
    end do                                     ! Gamma(n+1) = factorial(n)
    call system_clock(T2)       ! get time stamp
    MFLOPS = num*2.d0/((T2-T1)*1.d8)     ! compute MFlop/sec rate
!-------------------------------------------------------------------------
! Final answer:
    Phi = x/sqrt(2*pi) * val
    print *, 'Estimated Value of Phi:', Phi
    print *, 'The calculated number of MFLOPS is:', MFLOPS

end program LaplaceErrorFunction
