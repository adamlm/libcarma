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
project(libcarma_cmake)

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

add_library(libcarma_cmake INTERFACE)
add_library(libcarma::cmake ALIAS libcarma_cmake)

install(TARGETS libcarma_cmake
  EXPORT libcarma_cmakeTargets
)

install(EXPORT libcarma_cmakeTargets
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/libcarma_cmake
  FILE libcarma_cmakeTargets.cmake
  NAMESPACE libcarma::
)

set(libcarma_cmake_CMAKE_MODULES_DIR cmake)

configure_package_config_file(
  libcarma_cmakeConfig.cmake.in
  libcarma_cmakeConfig.cmake
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/libcarma_cmake
  PATH_VARS libcarma_cmake_CMAKE_MODULES_DIR
  NO_SET_AND_CHECK_MACRO
  NO_CHECK_REQUIRED_COMPONENTS_MACRO
)

install(FILES ${PROJECT_BINARY_DIR}/libcarma_cmakeConfig.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/libcarma_cmake
)

# Installing to a cmake/ subdirectory to prevent downstream projects from
# accidnetally including libcarma_cmakeTargets.cmake and libcarma_cmakeConfig.cmake
install(DIRECTORY cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/libcarma_cmake
)
