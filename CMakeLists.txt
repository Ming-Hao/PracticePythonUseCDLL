cmake_minimum_required(VERSION 3.10)

project(MyProject)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(DYLIB_NAME "my_dylib" CACHE STRING "Dylib name")

add_library(${DYLIB_NAME} SHARED
    cppfunc.h
    cppfunc.cpp)