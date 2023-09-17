add_executable(libcarma_sae_common_unit_tests
  test_bad_data_element_access.cpp
)

target_link_libraries(libcarma_sae_common_unit_tests
  PRIVATE
    libcarma::sae_common
    GTest::gtest_main
)

libcarma_target_set_compiler_warnings(libcarma_sae_common_unit_tests
  PRIVATE
  WARNINGS_AS_ERRORS
)

include(GoogleTest)
gtest_discover_tests(libcarma_sae_common_unit_tests)
