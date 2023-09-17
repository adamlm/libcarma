add_executable(libcarma_sae_j2735_tests
  test_angle.cpp
)

target_link_libraries(libcarma_sae_j2735_tests
  PRIVATE
    GTest::gtest_main
    libcarma::sae_j2735
)

include(GoogleTest)
gtest_discover_tests(libcarma_sae_j2735_tests)
