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

#include <gtest/gtest.h>
#include <libcarma/exception/exception.hpp>

TEST(TestException, ConstString)
{
  carma::exception::Exception const ex{"some string"};

  EXPECT_EQ(ex.what(), "some string");
}

TEST(TestException, MutableString)
{
  carma::exception::Exception ex{"some string"};
  ASSERT_EQ(ex.what(), "some string");

  ex.what() += " more text";
  EXPECT_EQ(ex.what(), "some string more text");
}
