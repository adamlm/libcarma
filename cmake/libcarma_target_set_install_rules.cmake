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
libcarma_target_set_install_rules
---------------------------------

This module defines a function to set the installation rules for a library. A
library must have installation rules to be installable after being built, but
the necessary CMake commands create a lot of duplicate boilerplate code. This
function consolidates that code so it can be used across CARMA Library.

.. command:: libcarma_target_set_install_rules

  Set the installation rules for a CMake library and its associated header,
  package configuration, and imported targets files:
  functions::

    libcarma_target_set_install_rules(target)

  ``libcarma_target_set_install_rules()`` sets a library's installation rules
  using the conventional structure for CARMA Library.

  The options are:

  ``target``
  Specifies the target that will have installation rules specified for it.

#]=======================================================================]

include(GNUInstallDirs)

function(libcarma_target_set_install_rules target)

  install(TARGETS ${target}
    EXPORT ${target}Targets
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  )

  install(DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/include/
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    FILES_MATCHING PATTERN "*.hpp"
  )

  install(FILES ${CMAKE_CURRENT_LIST_DIR}/cmake/${target}Config.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${target}
  )

  install(EXPORT ${target}Targets
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${target}
    FILE ${target}Targets.cmake
    NAMESPACE libcarma::
  )

endfunction()
