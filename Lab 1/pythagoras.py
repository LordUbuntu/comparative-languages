#!/usr/bin/python3
import math


# helper function to calculate dot product of vectors
# v . u
def dot(v, u):
    return sum((p * q for p, q in zip(v, u)))


# helper function to calculate magnitude of vector
# ||v||
def mag(v):
    total = 0
    for e in v:
        total += e ** 2
    return math.sqrt(total)


def trig(z1, z2, z3):
    angle_total = 0

    # safety dance
    # two or more overlapping coords == NAT (Not A Triangle)
    if z1 == z2 or z1 == z3 or z2 == z3:
        print("invalid: two or more coordinates are the same. Not A Triangle!")
        return

    # calculate the pair of vectors relative to an origin point foreach origin
    vp1 = (z1, (z1[0] - z2[0], z1[1] - z2[1]), (z1[0] - z3[0], z1[1] - z3[1]))
    vp2 = (z2, (z2[0] - z3[0], z2[1] - z3[1]), (z2[0] - z1[0], z2[1] - z1[1]))
    vp3 = (z3, (z3[0] - z2[0], z3[1] - z2[1]), (z3[0] - z1[0], z3[1] - z1[1]))
    vps = [vp1, vp2, vp3]

    # calculate sides and angles of each origin
    for vp in vps:
        origin = vp[0]
        v1, v2 = vp[1], vp[2]

        s1, s2 = mag(v1), mag(v2)

        # safety dance (Not A Triangle Checks)
        if dot(v1, v2) == (s1 * s2) or dot(v1, v2) == -(s1 * s2):
            # vectors are parallel and consequently angle is 0, NAT
            print("invalid: vectors are overlapping. Not A Triangle!")
            return

        theta = math.acos(dot(v1, v2) / (s1 * s2))
        angle_total += theta

        print(origin)
        print(s1)
        print(s2)
        print(math.degrees(theta))

    # safety dance, sum of all angles in a triange is 180deg (pi radians)
    assert angle_total == math.pi


def main():
    z1 = tuple(map(int, input("please provide first coordinate pair: ").split()))
    z2 = tuple(map(int, input("please provide first coordinate pair: ").split()))
    z3 = tuple(map(int, input("please provide first coordinate pair: ").split()))
    trig(z1, z2, z3)


if __name__ == "__main__":
    main()
