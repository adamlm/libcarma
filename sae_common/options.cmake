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

option(libcarma_sae_common_BUILD_TESTS
  "Build CARMA SAE Common Library tests"
  ${libcarma_BUILD_TESTS}
)

option(libcarma_sae_common_BUILD_INSTALL
  "Build CARMA SAE Common Library CMake install targets"
  ${libcarma_BUILD_INSTALL}
)

option(libcarma_sae_common_BUILD_DOCS
  "Build CARMA SAE Common Library docs"
  ${libcarma_BUILD_DOCS}
)

option(libcarma_sae_common_BUILD_PACKAGING
  "Build CARMA SAE Common Library packaging artifacts"
  ${libcarma_BUILD_PACKAGING}
)
