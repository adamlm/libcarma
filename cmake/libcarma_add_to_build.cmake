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
libcarma_add_to_build
---------------------

This module defines a function to conditionally add a subdirectory to the build
tree. Some CARMA Library libraries depend on others, but attempting to add
their subdirectories to the build tree will cause configuration errors if their
contained targets have already been added. Conditionally adding the
subdirectory avoids this issue.

.. command:: libcarma_add_to_build

  Add subdirectory to build if its contained targets have not already been
  added to the build tree:
  functions::

    libcarma_add_to_build(target)

  ``libcarma_add_to_build()`` adds the specified target's containing
  subdirectory to the build tree if the target has not already been added. Note
  that this function makes several implicit assumptions:

    1. Argument ``target`` uses the naming convention ``libcarma::<library>``,
       where ``<library>`` is the name of the CARMA Library library of interest.
    2. The containing subdirectory of ``<library>`` uses the name ``<library>``.

  The options are:

  ``target``
    Specifies the target name that will be checked.

#]=======================================================================]

function(libcarma_add_to_build target)

  string(REPLACE "libcarma::" "" target_no_namespace ${target})

  if(NOT TARGET ${target})
    add_subdirectory(${target_no_namespace})
  endif()

endfunction()
