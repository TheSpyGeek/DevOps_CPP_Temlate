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

# list(REMOVE_ITEM SRCS src/main.cpp)

# SRCS prends la valeur des headers
file(GLOB_RECURSE HEADERS
	src/*.h
	src/*.hpp
)





add_executable(${PROJECT_NAME}_run ${SRCS})
add_library(${PROJECT_NAME}_lib ${SRCS})

# ajout des includes directory
#include_directories(
#)

target_link_libraries(${PROJECT_NAME}_run ${CMAKE_DL_LIBS})
target_link_libraries(${PROJECT_NAME}_lib ${CMAKE_DL_LIBS})

# Ajout de la commande run

ADD_CUSTOM_TARGET(run COMMAND "./${PROJECT_NAME}_run"
  COMMENT "Run with ${CMAKE_BUILD_TYPE} configuration"
  DEPENDS ${PROJECT_NAME}_run
)

# Compilation des tests

add_subdirectory(lib/googletest)
add_subdirectory(tests)