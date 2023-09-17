#include <gtest/gtest.h>

#include <libcarma/sae_common/bad_data_element_access.hpp>

TEST(BadDataElementAccess, What)
{
  const carma::sae_common::BadDataElementAccess exception;

  EXPECT_EQ(exception.what(), "bad data element access (data data_unavailable)");
}
