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

#ifndef LIBCARMA_METAPROGRAMMING_ALWAYS_FALSE_HPP_
#define LIBCARMA_METAPROGRAMMING_ALWAYS_FALSE_HPP_

#include <type_traits>

namespace carma::metaprogramming
{

template <typename...>
struct always_false : std::false_type
{
};

template <typename... Ts>
using always_false_t = typename always_false<Ts...>::type;

template <typename... Ts>
inline constexpr bool always_false_v = always_false<Ts...>::value;

}  // namespace carma::metaprogramming

#endif  // LIBCARMA_METAPROGRAMMING_ALWAYS_FALSE_HPP_
