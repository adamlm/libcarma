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
project(libcarma_exception)

include(options.cmake)
include(dependencies.cmake)

add_library(libcarma_exception INTERFACE)
add_library(libcarma::exception ALIAS libcarma_exception)

target_include_directories(libcarma_exception
  INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
)

if(libcarma_exception_BUILD_TESTS)
  enable_testing()
  add_subdirectory(test)
endif()

if(libcarma_exception_BUILD_INSTALL)
  include(libcarma_target_set_install_rules)

  libcarma_target_set_install_rules(libcarma_exception)
endif()
