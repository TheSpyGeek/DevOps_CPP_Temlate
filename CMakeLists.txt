set(PROJECT_NAME DevOps-app)

cmake_minimum_required(VERSION 2.8)


project(${PROJECT_NAME})

enable_testing()

###### BUILD OPTION #######
if (CMAKE_GENERATOR MATCHES "Visual Studio")
    # Do Visual Studio specific stuff
else()
    add_definitions(-std=c++11 -pthread)
    if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
        message("DEBUG MODE ACTIVATED")

        add_definitions(-Wformat -Wall -g)

    endif()

    if("${CMAKE_BUILD_TYPE}" STREQUAL "Release")
            message("RELEASE MODE ACTIVATED")

            add_definitions(-O3)

    endif()
endif()


# BUILD TYPE = Debug | Release
if( NOT CMAKE_BUILD_TYPE )
  set(CMAKE_BUILD_TYPE Debug)
  message("BUILD TYPE = Debug | Release")
endif()



#### SET SOURCES ####


# SRCS prends la valeur des sources
file(GLOB_RECURSE SRCS
	src/*.c
	src/*.cpp
)

# SRCS prends la valeur des headers
file(GLOB_RECURSE HEADERS
	src/*.h
	src/*.hpp
)






add_executable(${PROJECT_NAME} ${HEADERS} ${SRCS})

# ajout des includes directory
#include_directories(
#)

target_link_libraries(${PROJECT_NAME} ${CMAKE_DL_LIBS})


project(Test)


add_executable(Test tests/test.cpp)
add_test(NAME mytest COMMAND ./Test)