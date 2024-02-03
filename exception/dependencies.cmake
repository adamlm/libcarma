find_package(libcarma_cmake REQUIRED)

if(libcarma_exception_BUILD_TESTS)
  find_package(GTest REQUIRED)
endif()
