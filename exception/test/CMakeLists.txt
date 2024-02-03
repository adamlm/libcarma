# Copyright 2024 Adam Morrissett
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include(libcarma_target_set_compiler_warnings)

add_executable(libcarma_exception_unit_tests
  test_exception.cpp
)

target_link_libraries(libcarma_exception_unit_tests
  PRIVATE
    libcarma::exception
    GTest::gtest_main
)

libcarma_target_set_compiler_warnings(libcarma_exception_unit_tests
  PRIVATE
  WARNINGS_AS_ERRORS
)

include(GoogleTest)
gtest_discover_tests(libcarma_exception_unit_tests)
