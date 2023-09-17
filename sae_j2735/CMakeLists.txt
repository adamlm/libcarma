include(options.cmake)
include(dependencies.cmake)

add_library(libcarma_sae_j2735 INTERFACE)
add_library(libcarma::sae_j2735 ALIAS libcarma_sae_j2735)

target_include_directories(libcarma_sae_j2735
  INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
)

target_link_libraries(libcarma_sae_j2735
  INTERFACE
    libcarma::sae_common
    units::units
)

if(libcarma_sae_j2735_BUILD_TESTS)
  add_subdirectory(test)
endif()

if(libcarma_sae_j2735_BUILD_INSTALL)
  libcarma_target_set_install_rules(libcarma_sae_j2735)
endif()
