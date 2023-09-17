#ifndef LIBCARMA_SAE_J2735_ANGLE_HPP_
#define LIBCARMA_SAE_J2735_ANGLE_HPP_

#include <libcarma/sae_common/data_element.hpp>
#include <libcarma/sae_common/units_extensions.hpp>

namespace carma::sae_j2735
{

struct AngleElementDescription
{
  using value_type = units::angle::eighth_deci_degree_t;

  static constexpr value_type max_value{28799};
  static constexpr value_type lower_value{0.0};
  static constexpr carma::sae_common::Availability availability{
    carma::sae_common::Availability::SometimesAvailable};
};

using Angle = sae_common::DataElement<AngleElementDescription>;
}  // namespace carma::sae_j2735

#endif  // LIBCARMA_SAE_J2735_ANGLE_HPP_
