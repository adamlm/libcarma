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

#[=======================================================================[.rst:
libcarma_run_clang_tidy_with_build
----------------------------------

This module defines a macro that enables runing clang-tidy for each target
built by the CMake project. Running clang-tidy alongside the CMake build makes
it easier for develoers to run static analysis on their code. Instead of
invoking clang-tidy manually, it gets run automatically.

.. command:: libcarma_run_clang_tidy_with_build

  Enable and run clang-tidy for each CMake target added after this macro is
  called:
  functions::

    libcarma_run_clang_tidy_with_build()

  ``libcarma_run_clang_tidy_with_build()`` enables running clang-tidy for all
  targets added after this macro is called. Calling this macro assumes that
  clang-tidy is installed on the system and is findable with ``find_program()``.
  If CMake cannot find clang-tidy, it will emit a warning message during
  project configuration. A .clang-tidy file is assumed to be at the
  project's root.

#]=======================================================================]

macro(libcarma_run_clang_tidy_with_build)

  find_program(clang_tidy_EXECUTABLE clang-tidy)

  file(RELATIVE_PATH current_directory_name
    ${PROJECT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
  )

  if(clang_tidy_EXECUTABLE)
    message(STATUS "libcarma ${current_directory_name}: Enabling clang-tidy")

    # CMake does not seem to pass C++ standard to clang-tidy when using GCC.
    # Related CMake issue: https://gitlab.kitware.com/cmake/cmake/-/issues/24238
    set(CMAKE_CXX_CLANG_TIDY "${clang_tidy_EXECUTABLE};-extra-arg=-std=c++${CMAKE_CXX_STANDARD}")
    set(CMAKE_C_CLANG_TIDY ${clang_tidy_EXECUTABLE})
  else()
    message(WARNING
      "libcarma ${current_directory_name}: Could not find clang-tidy "
      "executable. CMake will continue configuring the project, but it will "
      "not execute clang-tidy."
    )
  endif()

endmacro()
