! fortran version of python program
! note: arrays are indexed starting at 1

program pythagoras
  implicit none
  

  ! Type declarations (assumed to be cartesian coordinates of the form <x, y>)
  Integer :: i
  Real, parameter :: PI = 3.1415926

  Integer, dimension(2) :: z1, z2, z3     ! coordinates
  Integer, dimension(2, 3) :: vp1, vp2, vp3  ! vector pairs

  Integer, dimension(2, 9) :: vps
  Integer, dimension(2) :: origin, v1, v2
  Real :: angle_total = 0.0, theta = 0.0, s1, s2


  ! Program Input
  print *, "Please input first coordinate pair: "
  read (*,*) z1(1), z1(2)
  print *, "Please input second coordinate pair: "
  read (*,*) z2(1), z2(2)
  print *, "Please input third coordinate pair: "
  read (*,*) z3(1), z3(2)


  ! safety dance. any coordinate pair being equal means Not A Triangle
  if (z1(1) .eq. z2(1) .and. z1(2) .eq. z2(2) &
    .or. (z1(1) .eq. z3(1) .and. z1(2) .eq. z3(2)) &
    .or. (z2(1) .eq. z3(1) .and. z2(2) .eq. z3(2))) then
    print *, "invalid, two or more coordinates overlapping. Not A Triangle!"
  endif


  ! calculate vector pairs (of form <origin, vector1, vector2>)
  ! form <<origin_x, origin_y>, <vector1_x, vector1_y>, <vector2_x, vector2_y>>
  vp1 = reshape([z1(1), z1(2), z1(1) - z2(1), z1(2) - z2(2), z1(1) - z3(1), z1(2) - z3(2)], [2, 3])
  vp2 = reshape([z2(1), z2(2), z2(1) - z3(1), z2(2) - z3(2), z2(1) - z1(1), z2(2) - z1(2)], [2, 3])
  vp3 = reshape([z3(1), z3(2), z3(1) - z2(1), z3(2) - z2(2), z3(1) - z1(1), z3(2) - z1(2)], [2, 3])
  vps = reshape([vp1, vp2, vp3], [2, 9])


  ! calculate and show results foreach origin
  angle_total = 0.0
  do i = 1, 9, 3
    ! ...
    origin = vps(1:2, i)
    v1 = vps(1:2, i + 1)
    v2 = vps(1:2, i + 2)

    ! calculate lengths of sides
    s1 = mag(v1)
    s2 = mag(v2)

    ! check that dot(v1, v2) != (s1 * s2) or -(s1 * s2)
    if (dot_product(v1, v2) .eq. (s1 * s2) &
    .or. dot_product(v1, v2) .eq. -(s1 * s2)) then
      print *, "invalid: vectors are overlapping. Not A Triangle!"
      return
    endif

    ! calculate angle
    theta = acos(dot_product(v1, v2) / (s1 * s2))

    ! tally up total to ensure it is equal to pi (180 degrees)
    angle_total = angle_total + theta

    ! print results with respect to origin
    print *, "origin: ", origin
    print *, "side 1: ", s1
    print *, "side 2: ", s2
    print *, "angle: ", theta * 180.0 / PI   ! angle in degrees
    print *, ""
  end do

  ! safety dance: sum of all angles in a triangle is equal to pi radians
  if (angle_total .ne. PI) then
    print *, "angles don't sum to 180, something is wrong!"
    return
  end if


contains
! dot(v, u) is unnecessary since Fortran comes with dot_product builtins
  function mag(v) result(magnitude)
    implicit none
    Integer, dimension(2) :: v
    Integer :: total
    Real :: magnitude
    total = 0
    do i = 1, 2
      total = total + v(i)**2
    end do
    magnitude = sqrt(real(total))
  end function mag
end program pythagoras
