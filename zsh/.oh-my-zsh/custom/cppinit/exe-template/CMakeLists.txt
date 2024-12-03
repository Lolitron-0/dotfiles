cmake_minimum_required(VERSION 3.22)
project(__PROJECT_NAME__)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include_directories(include)

set(SOURCES src/Main.cpp)

add_executable(${PROJECT_NAME} ${SOURCES})

# Dependencies
include(FetchContent)

# fmt
message(STATUS "Fetching dependency: fmt")
FetchContent_Declare(
  fmt
  GIT_REPOSITORY https://github.com/fmtlib/fmt
  GIT_TAG 0c9fce2ffefecfdce794e1859584e25877b7b592) # 11.0.2
FetchContent_MakeAvailable(fmt)
target_link_libraries(${PROJECT_NAME} PRIVATE fmt::fmt)

# boost
if(0)
  message(STATUS "Fetching dependency: boost (may take a while)")
  add_compile_definitions(BOOST_ENABLE_ASSERT_DEBUG_HANDLER)

  set(BOOST_ENABLE_CMAKE ON)
  set(BOOST_INCLUDE_LIBRARIES assert;stacktrace;range)
  FetchContent_Declare(
    Boost
    URL https://github.com/boostorg/boost/releases/download/boost-1.86.0/boost-1.86.0-cmake.tar.xz
        DOWNLOAD_EXTRACT_TIMESTAMP
        ON)

  FetchContent_MakeAvailable(Boost)
endif()
