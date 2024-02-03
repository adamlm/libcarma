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

find_package(libcarma_cmake REQUIRED)
find_package(libcarma_sae_common REQUIRED)
find_package(units REQUIRED)

if(libcarma_sae_j2735_BUILD_TESTS)
  find_package(GTest REQUIRED)
endif()
