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
libcarma_target_set_compiler_warnings
-------------------------------------

This module defines a function to set the compiler warning options for a
specified target. The function enables several warnings that alert to common
code issues. Note that there currently is no way to change the set of applied
options, but callers can specify if warnings should be treated as errors.

.. command:: libcarma_target_set_compiler_warnings

  Set the compiler warnings for a specified target:
  functions::

    libcarma_target_set_compiler_warnings(target scope as_error)

    ``libcarma_target_set_compiler_warnings()`` enables several compiler
    warnings for the specified target. The applied warning set covers common
    code issues that should be straightforward to prevent and resolve.

    The options are:

    ``target``
    Specifies the target that will have the compiler options enabled.

    ``scope``
    The ``INTERFACE``, ``PUBLIC``, and ``PRIVATE`` keywords are required to
    specify the scope of the compiler warnings.

    ``WARNINGS_AS_ERRORS``
    If specified, warnings raised by the compiler will be treated as errors.
    Specifying this argument will enable the ``-Werror`` warning for GCC/Clang
    and ``/WX`` for the Microsoft Visual C++ (MSVC) compiler.

#]=======================================================================]

function(libcarma_target_set_compiler_warnings target scope)

  set(noValues WARNINGS_AS_ERRORS)

  cmake_parse_arguments(
    PARSE_ARGV 2
    ARG
    "${noValues}"
    "" # Function has no single-value keyword arguments
    "" # Function has no multi-value keyword arguments
  )

  target_compile_options(${target} ${scope}
    # Common to Clang and GCC
    $<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:AppleClang>,$<CXX_COMPILER_ID:GNU>>:
      -Wall
      -Wextra
      -Wshadow
      -Wnon-virtual-dtor
      -Wold-style-cast
      -Wcast-align
      -Wunused
      -Woverloaded-virtual
      -Wpedantic
      -Wconversion
      -Wsign-conversion
      -Wnull-dereference
      -Wdouble-promotion
      -Wformat=2
      -Wimplicit-fallthrough
      $<$<BOOL:ARG_WARNINGS_AS_ERRORS>:-Werror>
    >

    # Specific to GCC
    $<$<CXX_COMPILER_ID:GNU>:
      -Wmisleading-indentation
      -Wduplicated-cond
      -Wduplicated-branches
      -Wlogical-op
      -Wuseless-cast
    >

    # Specific to Microsoft Visual C++ (MSVC) compiler
    $<$<CXX_COMPILER_ID:MSCV>:
      /W4
      /w14242
      /w14254
      /w14263
      /w14265
      /w14287
      /we4289
      /w14296
      /w14311
      /w14545
      /w14546
      /w14547
      /w14549
      /w14555
      /w14619
      /w14640
      /w14826
      /w14905
      /w14906
      /w14928
      /permissive-
      $<$<BOOL:ARG_WARNINGS_AS_ERRORS>:/WX>
    >
  )

endfunction()
