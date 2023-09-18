# Copyright 2023 Adam Morrissett
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

# This project uses PROJECT_IS_TOP_LEVEL and C_STANDARD 17, both of which were
# added in CMake 3.21.
cmake_minimum_required(VERSION 3.21)
project(libcarma)
enable_testing()

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(options.cmake)
include(dependencies.cmake)

# CARMA targets C++17 and C17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD 17)

set(CMAKE_EXPORT_COMPILE_COMMANDS ${libcarma_EXPORT_COMPILE_COMMANDS})

# This prevents colcon from trying to build CMake build artifacts when the
# project is incorporated into a ROS 2 workspace.
file(TOUCH ${PROJECT_BINARY_DIR}/COLCON_IGNORE)

include(FetchContent)

if(libcarma_metaprogramming_BUILD_LIBRARY)
  libcarma_add_to_build(libcarma_metaprogramming)
endif()

if(libcarma_sae_common_BUILD_LIBRARY)
  libcarma_add_to_build(libcarma_sae_common)
endif()

if(libcarma_sae_j2735_BUILD_LIBRARY)
  libcarma_add_to_build(libcarma_sae_j2735)
endif()
