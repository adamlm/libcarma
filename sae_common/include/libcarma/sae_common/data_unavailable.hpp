#ifndef LIBCARMA_SAE_COMMON_DATA_UNAVAILABLE_HPP_
#define LIBCARMA_SAE_COMMON_DATA_UNAVAILABLE_HPP_

namespace carma::sae_common
{

struct data_unavailable_t
{
  constexpr explicit data_unavailable_t(int /* unused */) {}
};

inline constexpr data_unavailable_t data_unavailable{0};

} // namespace carma::sae_common


#endif // LIBCARMA_SAE_COMMON_DATA_UNAVAILABLE_HPP_
