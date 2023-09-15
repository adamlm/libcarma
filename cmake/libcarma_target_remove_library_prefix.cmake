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
libcarma_target_remove_library_prefix
-------------------------------------

This module defines a function to remove a library's name prefix. Linux- and
Unix-based systems normally prefix libraries with ``lib``, which can lead to
clunky names for libraries whose names already start with ``lib``.

.. command:: libcarma_target_remove_library_prefix

  Remove a library's name prefix:
  functions::

    libcarma_target_remove_library_prefix(target)

  ``libcarma_target_remove_library_prefix()`` removes a library's prefix by
  setting the ``PREFIX`` property to an empty string.

  The options are:

  ``target``
    Specifies the target that will have its prefix removed.

#]=======================================================================]

function(libcarma_target_remove_library_prefix target)

  set_target_properties(${target} PROPERTIES
    PREFIX ""
  )

endfunction()
