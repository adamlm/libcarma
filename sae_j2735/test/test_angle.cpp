#include <gtest/gtest.h>
#include <units.h>

#include <libcarma/sae_j2735/angle.hpp>

TEST(Angle, Simple)
{
  using namespace units::literals;

  const carma::sae_j2735::Angle angle{42.034_deg};

  EXPECT_EQ(angle.value(), units::angle::eighth_deci_degree_t{42.034_deg});
}
