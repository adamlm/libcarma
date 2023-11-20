add_executable(libcarma_chrono_unit_tests
  test_kafka_clock.cpp
)

target_link_libraries(libcarma_chrono_unit_tests
  PRIVATE
    libcarma::chrono
    GTest::gtest_main
)

libcarma_target_set_compiler_warnings(libcarma_chrono_unit_tests
  PRIVATE
  WARNINGS_AS_ERRORS
)

include(GoogleTest)
gtest_discover_tests(libcarma_chrono_unit_tests)
