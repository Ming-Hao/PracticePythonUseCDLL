cmake_minimum_required(VERSION 3.10)
project(printshared)

# 1. build library
add_library(printshared SHARED 
    ../cppfunc.h
    ../cppfunc.cpp)

# 2. build google test executable
include_directories(../)
add_executable(test_printshared test_cppfunc.cpp)
    
target_link_libraries(test_printshared PRIVATE printshared)

# 3. use google test
include(FetchContent)
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.12.1
)

FetchContent_MakeAvailable(googletest)
target_link_libraries(test_printshared PRIVATE gtest gtest_main)

include(GoogleTest)
gtest_discover_tests(test_printshared)

# 4. use ctest
include(CTest) 
enable_testing()