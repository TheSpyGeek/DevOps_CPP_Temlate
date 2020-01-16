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

list(REMOVE_ITEM SRCS src/main.cpp)

# SRCS prends la valeur des headers
file(GLOB_RECURSE HEADERS
	src/*.h
	src/*.hpp
)




add_library(compiledSRC ${SRCS})

add_executable(${PROJECT_NAME} src/main.cpp)

# ajout des includes directory
#include_directories(
#)

target_link_libraries(${PROJECT_NAME} ${CMAKE_DL_LIBS} compiledSRC)


ADD_CUSTOM_TARGET(run COMMAND "./${PROJECT_NAME}"
  COMMENT "Run with ${CMAKE_BUILD_TYPE} configuration"
  DEPENDS ${PROJECT_NAME}
)

file(GLOB_RECURSE TEST_FILES
	tests/*.cpp
)

#foreach(file ${TEST_FILES})
#    add_executable(${file} ${file})
#    add_test(NAME ${file} COMMAND "./${file}")
#endforeach(file)

#add_executable(test1exe tests/test.cpp)
#add_executable(test2exe tests/test2.cpp)
#add_executable(test3exe tests/test3.cpp)

#add_test(NAME test1 COMMAND ./test1exe DEPENDS test1exe)
#add_test(NAME test2 COMMAND ./test2exe)
#add_test(NAME test3 COMMAND ./test3exe)

