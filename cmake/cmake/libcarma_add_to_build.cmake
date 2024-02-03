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

This module defines a function to add a CARMA Library to the build tree. Some
CARMA libraries may be built as standalone libraries while also being included
as dependencies for  other CARMA libraries simultanesouly being built. Using
the add_subdirectory() function can lead to issues in this case because the
contained targets would be defined multiple times. Instead, we can use
``FetchContent``, which provides the end-results we are looking for but without
the management headache.

.. command:: libcarma_add_to_build

  Add specified CARMA Library package's directory to the buld tree using
  ``FetchContent``:
  functions::

    libcarma_add_to_build(package)

  ``libcarma_add_to_build()`` adds the specified CARMA Library package's
  containing subdirectory to the build tree using ``FetchContent``. Note
  that this function makes several implicit assumptions:

    1. Argument ``package`` uses the naming convention ``libcarma_<library>``,
       where ``<library>`` is the name of the CARMA Library library of interest.
    2. The containing subdirectory of ``<library>`` uses the name ``<library>``.

  The options are:

  ``package``
    Specifies the CARMA Library package name that will be added. The name
    specified in this option is the same name that would be used in a
    ``find_pacakge()`` call.

#]=======================================================================]

include(FetchContent)

function(libcarma_add_to_build package)

  string(REPLACE "libcarma_" "" package_no_prefix ${package})

  FetchContent_Declare(${package}
    SOURCE_DIR ${PROJECT_SOURCE_DIR}/${package_no_prefix}
  )

  FetchContent_MakeAvailable(${package})

endfunction()
