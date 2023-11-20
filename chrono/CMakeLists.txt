include(options.cmake)
include(dependencies.cmake)

add_library(libcarma_chrono
  src/kafka_clock.cpp
)

add_library(libcarma::chrono ALIAS libcarma_chrono)

target_include_directories(libcarma_chrono
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
)

if(libcarma_chrono_BUILD_TESTS)
  add_subdirectory(test)
endif()
