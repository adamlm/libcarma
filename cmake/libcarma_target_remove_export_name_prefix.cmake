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
libcarma_target_remove_export_name_prefix
-----------------------------------------

This module defines a function that removes the ``libcarma_`` prefix from a
specified CARMA Library target's ``EXPORT_NAME``. By convention, CARMA Library
names its CMake targets ``libcarma_<library>``, but this naming convention
makes a user's CMake configuration look like ``libcarma::libcarma_<library>``
when they want to link against that library.

.. command:: libcarma_target_remove_export_name_prefix

  Remove the ``libcarma_`` prefix from a target's ``EXPORT_NAME``:
  functions::

    libcarma_target_remove_export_name_prefix(target)

  ``libcarma_target_remove_export_name_prefix()`` removes the ``libcarma_``
  prefix from a specified target's ``EXPORT_NAME``.

  The options are:

  ``target``
    Specifies the target that will have its ``EXPORT_NAME`` modified.

#]=======================================================================]

function(libcarma_target_remove_export_name_prefix target)

  if(target MATCHES "libcarma_*")
    string(REPLACE "libcarma_" "" target_no_prefix ${target})

    set_target_properties(${target}
      PROPERTIES
        EXPORT_NAME ${target_no_prefix}
    )
  endif()

endfunction()
