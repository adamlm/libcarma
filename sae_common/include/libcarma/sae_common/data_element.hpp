#ifndef LIBCARMA_SAE_COMMON_DATA_HPP_
#define LIBCARMA_SAE_COMMON_DATA_HPP_

#include <algorithm>
#include <libcarma/metaprogramming/always_false.hpp>
#include <optional>
#include <type_traits>

#include "libcarma/sae_common/bad_data_element_access.hpp"
#include "libcarma/sae_common/data_unavailable.hpp"
#include "libcarma/sae_common/units_extensions.hpp"

namespace carma::sae_common
{

enum class Availability
{
  AlwaysAvailable,
  SometimesAvailable
};

namespace detail
{

template <typename DataTraits, typename = void>
struct storage_dispatcher_sfinae
{
  static_assert(
    metaprogramming::always_false_v<DataTraits>,
    "Could not find a class template specialization for specified `DataTraits` type");
};

template <typename DataTraits>
struct storage_dispatcher_sfinae<
  DataTraits, std::enable_if_t<DataTraits::availability == Availability::SometimesAvailable>>
{
  using type = std::optional<typename DataTraits::value_type>;
};

template <typename DataTraits>
struct storage_dispatcher_sfinae<
  DataTraits, std::enable_if_t<DataTraits::availability == Availability::AlwaysAvailable>>
{
  using type = typename DataTraits::value_type;
};

template <typename DataTraits>
struct storage_dispatcher : storage_dispatcher_sfinae<DataTraits>
{
};

template <typename DataTraits>
using storage_dispatcher_t = typename storage_dispatcher<DataTraits>::type;

}  // namespace detail

template <typename DataTraits>
class DataElement
{
  using value_type = typename DataTraits::value_type;

public:
  [[nodiscard]] static inline constexpr auto max() noexcept -> value_type
  {
    return DataTraits::max_value;
  }
  [[nodiscard]] static inline constexpr auto lower() noexcept -> value_type
  {
    return DataTraits::lower_value;
  }

  constexpr explicit DataElement() = default;
  constexpr explicit DataElement(const value_type & value) { this->operator=(value); }

  template <
    typename DT = DataTraits,
    std::enable_if_t<DT::availability == Availability::SometimesAvailable, bool> = true>
  constexpr explicit DataElement(sae_common::data_unavailable_t /* data_unavailable */)
  : value_{std::nullopt}
  {
  }

  constexpr inline auto operator=(const value_type & value) noexcept -> DataElement<DataTraits> &
  {
    value_ = std::clamp(value, lower(), max());
    return *this;
  }

  template <
    typename DT = DataTraits,
    std::enable_if_t<DT::availability == Availability::SometimesAvailable, bool> = true>
  constexpr inline auto operator=(sae_common::data_unavailable_t /* data_unavailable */) noexcept
    -> DataElement<DataTraits> &
  {
    value_ = std::nullopt;
    return *this;
  }

  template <
    typename DT = DataTraits,
    std::enable_if_t<DT::availability == Availability::SometimesAvailable, bool> = true>
  [[nodiscard]] constexpr auto is_available() const noexcept -> bool
  {
    return value_.has_value();
  }

  [[nodiscard]] constexpr auto value() const
  {
    if constexpr (DataTraits::availability == Availability::SometimesAvailable) {
      if (!value_.has_value()) {
        throw BadDataElementAccess();
      }

      return value_.value();
    } else {
      return value_;
    }
  }

private:
  detail::storage_dispatcher_t<DataTraits> value_;
};

}  // namespace carma::sae_common

#endif  // LIBCARMA_SAE_COMMON_DATA_HPP_
