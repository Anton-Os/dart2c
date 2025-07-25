cmake_minimum_required(VERSION 3.7)
project(Dart2C DESCRIPTION "Dart Bindings Project")

add_library(Dart2C SHARED dart2c.c)

add_library(Dart2CPP SHARED dart2cpp.cpp)