set(PROJECT_NAME DevOps-app)

cmake_minimum_required(VERSION 2.8)


set(TESTS_BUILD_DIRECTORY buildtests)

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

# Ajout de la commande run

ADD_CUSTOM_TARGET(run COMMAND "./${PROJECT_NAME}"
  COMMENT "Run with ${CMAKE_BUILD_TYPE} configuration"
  DEPENDS ${PROJECT_NAME}
)

# Compilation des tests

file(GLOB_RECURSE TEST_FILES
	tests/*.cpp
)

file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/${TESTS_BUILD_DIRECTORY})

foreach(file ${TEST_FILES})
    get_filename_component(basename ${file} NAME )
    get_filename_component(basenameWE ${file} NAME_WE )
    
    
    add_executable(${TESTS_BUILD_DIRECTORY}/${basenameWE} ${file})
    #add_test(NAME ${basenameWE} COMMAND "./${basenameWE}")
    message(${basename})
endforeach(file)

#add_executable(test1exe tests/test.cpp)
#add_executable(test2exe tests/test2.cpp)
#add_executable(test3exe tests/test3.cpp)

#add_test(NAME test1 COMMAND ./test1exe DEPENDS test1exe)
#add_test(NAME test2 COMMAND ./test2exe)
#add_test(NAME test3 COMMAND ./test3exe)

