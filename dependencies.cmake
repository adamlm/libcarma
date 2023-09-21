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

include(libcarma_add_to_build)
include(libcarma_target_remove_library_prefix)
include(libcarma_target_remove_export_name_prefix)
include(libcarma_target_set_compiler_warnings)
include(libcarma_target_set_install_rules)
include(libcarma_run_clang_tidy_with_build)

include(${PROJECT_SOURCE_DIR}/dependency_versions.cmake)

# Install CMake dependency management script
# The get_cpm.cmake script must be included before CPMAddPackage(...) calls
set(CPM_DOWNLOAD_VERSION 0.38.2)
include(get_cpm)

# Tell CPM to search for locally-installed packages before using the source
set(CPM_USE_LOCAL_PACKAGES ON)

CPMAddPackage("gh:google/googletest#${libcarma_google_googletest_DEP_VERSION}")
