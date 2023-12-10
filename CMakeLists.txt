cmake_minimum_required(VERSION 3.10)

project(MyProject)

set(DYLIB_NAME "my_dylib" CACHE STRING "Dylib name")

add_library(${DYLIB_NAME} SHARED
    cppfunc.h
    cppfunc.cpp)