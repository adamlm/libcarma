#ifndef LIBCARMA_SAE_COMMON_UNITS_HPP_
#define LIBCARMA_SAE_COMMON_UNITS_HPP_

#include <units.h>

namespace units
{

template <typename T>
constexpr auto remove_units(const T & value) noexcept
{
  return units::unit_cast<typename T::underlying_type>(value);
}

UNIT_ADD(
  angle, eighth_deci_degree, eighth_deci_degrees, eighth_deci_deg,
  unit<std::ratio_multiply<std::ratio<1, 8>, std::deci>, degrees>);

UNIT_ADD(
  velocity, two_centi_meter_per_second, two_centi_meters_per_second, two_centi_mps,
  unit<std::ratio_multiply<std::ratio<2, 1>, std::centi>, meters_per_second>);

}  // namespace units

#endif  // LIBCARMA_SAE_COMMON_UNITS_HPP_
