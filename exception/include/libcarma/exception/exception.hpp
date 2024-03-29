// Copyright 2024 Adam Morrissett
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

#ifndef LIBCARMA_EXCEPTION_HPP
#define LIBCARMA_EXCEPTION_HPP

#include <string>
#include <utility>

namespace carma::exception
{
class Exception
{
public:
  explicit Exception(std::string_view str) : str_{str} {}

  auto what() const noexcept -> std::string const & { return str_; }
  auto what() -> std::string & { return const_cast<std::string &>(std::as_const(*this).what()); }

private:
  std::string str_{""};
};

}  // namespace carma::exception

#endif  // LIBCARMA_EXCEPTION_HPP
