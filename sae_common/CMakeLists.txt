include(options.cmake)
include(dependencies.cmake)

add_library(libcarma_sae_common INTERFACE)
add_library(libcarma::sae_common ALIAS libcarma_sae_common)

target_include_directories(libcarma_sae_common
  INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
)

target_link_libraries(libcarma_sae_common
  INTERFACE
    libcarma::metaprogramming
    units::units
)

if(libcarma_sae_common_BUILD_TESTS)
  add_subdirectory(test)
endif()

if(libcarma_sae_common_BUILD_INSTALL)
  libcarma_target_set_install_rules(libcarma_sae_common)
endif()
