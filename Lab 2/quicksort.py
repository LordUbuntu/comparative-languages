# Name: Jacobus Burger
# CMPT 360 A, Spring 2021
# Lab Assignment 2
# Quicksort with Python and Pascal
from random import randint as rand


def quicksort(array, low, high):
    if low < high:
        part = partition(array, low, high)
        quicksort(array, low, part - 1)
        quicksort(array, part + 1, high)


def partition(array, low, high):
    pivot = array[high]
    i = low
    for j in range(low, high):
        if array[j] < pivot:
            array[i], array[j] = array[j], array[i]
            i += 1
    array[i], array[high] = array[high], array[i]
    return i


def main():
    # create 3 arrays, assigning random values to their indices
    arr1 = [rand(0, 100) for i in range(100)]
    arr2 = [rand(0, 1000) for i in range(1000)]
    arr3 = [rand(0, 10000) for i in range(10000)]

    # pretty print input arrays
    print("===== INPUT =====")
    print(arr1)
    print(arr2)
    print(arr3)

    # sort arrays
    quicksort(arr1, 0, len(arr1) - 1)
    quicksort(arr2, 0, len(arr2) - 1)
    quicksort(arr3, 0, len(arr3) - 1)

    # pretty print output arrays
    print("===== OUTPUT =====")
    print(arr1)
    print(arr2)
    print(arr3)


if __name__ == "__main__":
    main()
