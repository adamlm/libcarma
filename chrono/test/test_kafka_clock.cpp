#include <gtest/gtest.h>

#include <iostream>
#include <libcarma/chrono/kafka_clock.hpp>

class CannedKafkaTimeSource : public carma::chrono::KafkaTimeSource
{
private:
  auto do_now() -> carma::chrono::KafkaClock::time_point override
  {
    return carma::chrono::KafkaClock::time_point{std::chrono::seconds{1}};
  }
};

TEST(KafkaClock, Simple)
{
  CannedKafkaTimeSource canned_kafka_time_source{};

  carma::chrono::set_kafka_time_source(&canned_kafka_time_source);

//   auto now = carma::chrono::KafkaClock::now();
//   std::cout << std::chrono::seconds;
}
