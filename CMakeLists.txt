cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    project1
    VERSION 1.0.0
    DESCRIPTION "exemple de projet en cmake"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

#https://cmake.org/cmake/help/latest/module/FindSDL.html
#A NE PAS UTILISER CAR NE PREND PAS EN COMPTE LA DERNIERE VERSION DE SDL
#find_package(SDL REQUIRED)

#git clone https://github.com/aminosbh/sdl2-cmake-modules cmake/sdl2
#si pas installé alors lancer la commande sudo apt install libsdl2-dev
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/sdl2)
find_package(SDL2 REQUIRED)


# ---- Declare library ----

add_library(
    project1_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    project1_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(project1_lib PUBLIC cxx_std_17)

# ---- Declare executable ----

add_executable(project1_exe source/main.cpp)
add_executable(project1::exe ALIAS project1_exe)

set_property(TARGET project1_exe PROPERTY OUTPUT_NAME project1)

target_compile_features(project1_exe PRIVATE cxx_std_17)

target_link_libraries(project1_exe PRIVATE project1_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT project1_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of project1"
  )
endif()

include(cmake/dev-mode.cmake)
