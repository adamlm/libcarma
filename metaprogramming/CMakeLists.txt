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

cmake_minimum_required(VERSION 3.25)
project(libcarma_metaprogramming)

include(options.cmake)
include(dependencies.cmake)

if(libcarma_metaprogramming_RUN_CLANG_TIDY)
  # Note: this function must be called before any libraries or executables
  # are added. Otherwise, clang-tidy will not be run on them.
  libcarma_run_clang_tidy_with_build()
endif()

add_library(libcarma_metaprogramming INTERFACE)
add_library(libcarma::metaprogramming ALIAS libcarma_metaprogramming)

target_include_directories(libcarma_metaprogramming
  INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
)

if(libcarma_metaprogramming_BUILD_TESTS)
  enable_testing()
  add_subdirectory(test)
endif()

if(libcarma_metaprogramming_BUILD_INSTALL)
  include(libcarma_target_set_install_rules)

  libcarma_target_set_install_rules(libcarma_metaprogramming)
endif()
