cmake_minimum_required(VERSION 3.10)
project(tp0 C)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -ggdb -Wall -pedantic -Werror")
set(CMAKE_C_STANDARD 99)

add_executable(tp0 main.c file.c command.c encode.c)