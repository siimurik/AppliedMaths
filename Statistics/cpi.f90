program cpi
    double precision val, pi, MFLOPS
    integer i, T1, T2
    num = 1000000
    val = 0.D0
    call system_clock(T1)       ! get time stamp
    do i = 1, num
        val = val + ((-1.D0)**(i+1.D0))/(2.D0*i-1.D0)
    end do
    call system_clock(T2)       ! get time stamp
    MFLOPS = num*2.d0/((T2-T1)*1.d8)     ! compute MFlop/sec rate
    pi = val*4.d0
    print *, 'Estimated Value of PI:', pi
    print *, 'The calculated number of MFLOPS is:', MFLOPS
end program cpi