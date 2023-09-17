#include <gtest/gtest.h>
#include <units.h>

#include <libcarma/sae_common/data_element.hpp>

namespace
{

struct AlwaysAvailableTestTraits
{
  using value_type = units::length::meter_t;

  static constexpr value_type max_value{200};
  static constexpr value_type lower_value{-30};
  static constexpr carma::sae_common::Availability availability{
    carma::sae_common::Availability::AlwaysAvailable};
};

struct SometimesAvailableTestTraits
{
  using value_type = units::length::meter_t;

  static constexpr value_type max_value{100};
  static constexpr value_type lower_value{-40};
  static constexpr carma::sae_common::Availability availability{
    carma::sae_common::Availability::SometimesAvailable};
};

using AlwaysAvailableTestDataElement = carma::sae_common::DataElement<AlwaysAvailableTestTraits>;

using SometimesAvailableTestDataElement =
  carma::sae_common::DataElement<SometimesAvailableTestTraits>;

}  // namespace

TEST(AlwaysAvailableTestDataElement, Available)
{
  using namespace units::literals;

  const AlwaysAvailableTestDataElement data_element{12.0_m};

  // This checks almost-equality because of how the units library implements the operator overload
  EXPECT_EQ(data_element.value(), 12.0_m);
}

TEST(AlwaysAvailableTestDataElement, ValueTooHigh)
{
  using namespace units::literals;

  const AlwaysAvailableTestDataElement data_element{500_m};

  EXPECT_DOUBLE_EQ(
    units::unit_cast<double>(data_element.value()), units::unit_cast<double>(data_element.max()));
}

TEST(AlwaysAvailableTestDataElement, ValueTooLow)
{
  using namespace units::literals;

  const AlwaysAvailableTestDataElement data_element{-50_m};

  EXPECT_DOUBLE_EQ(
    units::unit_cast<double>(data_element.value()), units::unit_cast<double>(data_element.lower()));
}

TEST(SometimesAvailableTestDataElement, Available)
{
  using namespace units::literals;

  const SometimesAvailableTestDataElement data_element{12.0_m};
  ASSERT_TRUE(data_element.is_available());

  EXPECT_DOUBLE_EQ(units::unit_cast<double>(data_element.value()), 12.0);
}

TEST(SometimesAvailableTestDataElement, DataUnavailable)
{
  {
    const SometimesAvailableTestDataElement data_element;
    EXPECT_FALSE(data_element.is_available());
  }
  {
    const SometimesAvailableTestDataElement data_element{carma::sae_common::data_unavailable};
    EXPECT_FALSE(data_element.is_available());
  }
  {
    SometimesAvailableTestDataElement data_element;
    data_element = carma::sae_common::data_unavailable;
    EXPECT_FALSE(data_element.is_available());
  }
}

TEST(SometimesAvailableTestDataElement, ValueTooHigh)
{
  using namespace units::literals;

  const SometimesAvailableTestDataElement data_element{200_m};

  EXPECT_DOUBLE_EQ(
    units::unit_cast<double>(data_element.value()), units::unit_cast<double>(data_element.max()));
}

TEST(SometimesAvailableTestDataElement, ValueTooLow)
{
  using namespace units::literals;

  const SometimesAvailableTestDataElement data_element{-40_m};

  EXPECT_DOUBLE_EQ(
    units::unit_cast<double>(data_element.value()), units::unit_cast<double>(data_element.lower()));
}

TEST(SometimesAvailableTestDataElement, BadDataElementAccess)
{
  const SometimesAvailableTestDataElement data_element;

  EXPECT_THROW((void)data_element.value(), carma::sae_common::BadDataElementAccess);
}
