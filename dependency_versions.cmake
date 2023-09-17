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

# This file contains the library versions used by various CARMA Library
# libaries. Having libraries be self-contained is one of CARMA Library's goals,
# but having each library responsible for declaring its own dependencies cna
# lead to libraries using different versions of common dependencies. The
# opposite end, having a centralized dependencies file, would require us to
# use some complicated logic to determine when we should fetch certain
# dependencies. As a compromise, we decided to let each library declare its
# own dependencies, but only if they get the dependency version from a
# centralized list. This allows us to easily manage dependency versions
# through CARMA Library.

set(libcarma_google_googletest_DEP_VERSION v1.14.0)
set(libcarma_nholthaus_units_DEP_VERSION v2.3.3)
