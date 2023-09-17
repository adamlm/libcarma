#ifndef LIBCARMA_SAE_COMMON_BAD_DATA_ELEMENT_ACCESS_HPP_
#define LIBCARMA_SAE_COMMON_BAD_DATA_ELEMENT_ACCESS_HPP_

#include <exception>

namespace carma::sae_common
{

class BadDataElementAccess : public std::exception
{
public:
  BadDataElementAccess() = default;

  BadDataElementAccess(const BadDataElementAccess &) = default;
  auto operator=(const BadDataElementAccess &) -> BadDataElementAccess & = default;

  BadDataElementAccess(BadDataElementAccess &&) = default;
  auto operator=(BadDataElementAccess &&) -> BadDataElementAccess & = default;

  ~BadDataElementAccess() override = default;

  [[nodiscard]] auto what() const noexcept -> const char * override
  {
    return "bad data element access (data data_unavailable)";
  }
};

}  // namespace carma::sae_common

#endif  // LIBCARMA_SAE_COMMON_BAD_DATA_ELEMENT_ACCESS_HPP_
