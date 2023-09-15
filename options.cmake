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

# Project-wide options
option(libcarma_EXPORT_COMPILE_COMMANDS
  "Export CARMA Library CMake compile commands"
  ${PROJECT_IS_TOP_LEVEL}
)

option(libcarma_BUILD_LIBRARIES
  "Build all CARMA Library libraries by default"
  ${PROJECT_IS_TOP_LEVEL}
)

option(libcarma_BUILD_TESTS
  "Build all CARMA Library tests by default"
  ${PROJECT_IS_TOP_LEVEL}
)

option(libcarma_BUILD_INSTALL
  "Build all CARMA Library CMake install targets by default"
  ${PROJECT_IS_TOP_LEVEL}
)

option(libcarma_BUILD_DOCS
  "Build all CARMA Library docs by default"
  ${PROJECT_IS_TOP_LEVEL}
)

option(libcarma_BUILD_PACKAGING
  "Build packaging artifacts for CARMA Library"
  ${PROJECT_IS_TOP_LEVEL}
)

# Options to build individual libraries
option(libcarma_metaprogramming_BUILD_LIBRARY
  "Build CARMA Metaprogramming library"
  ${libcarma_BUILD_LIBRARIES}
)
