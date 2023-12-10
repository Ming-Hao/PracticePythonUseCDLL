from ctypes import *
import timeit

def initialize_library(library_path):
    # Initialize the library using the provided path
    mycalc = CDLL(library_path)
    # Other initialization operations can be added here

    return mycalc

def py_function(count):
    sum = 0
    for i in range(1000000):
        sum = sum + i

def cpp_function(count):
    sum = mycalc.loop(count)

if __name__ == "__main__":
    # Get the library_path from the command line arguments
    import sys
    if len(sys.argv) < 2:
        print("Please provide the dylib path")
        sys.exit(1)

    library_path = sys.argv[1]

    # Initialize the library
    mycalc = initialize_library(library_path)

    # set restype
    # it is important, otherwise result is 0
    mycalc.add.restype = c_double
    mycalc.loop.restype = c_int

    result = mycalc.add(c_double(8.1), c_double(15))
    print(result)

    execution_time_1 = timeit.timeit(lambda: py_function(1000000), number=1)
    print(f"Execution Time 1: {execution_time_1} second")


    execution_time_2 = timeit.timeit(lambda: cpp_function(1000000), number=1)
    print(f"Execution Time 2: {execution_time_2} second")






