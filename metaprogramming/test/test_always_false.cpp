// Copyright 2023 Adam Morrissett
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <libcarma/metaprogramming/always_false.hpp>

struct T
{
};

static_assert(!carma::metaprogramming::always_false<T>::value);
static_assert(!carma::metaprogramming::always_false_v<T>);

static_assert(std::is_same_v<carma::metaprogramming::always_false<T>::type, std::false_type>);
static_assert(std::is_same_v<carma::metaprogramming::always_false_t<T>, std::false_type>);
