#include "libcarma/chrono/kafka_clock.hpp"

namespace carma::chrono
{

namespace
{
KafkaTimeSource * kafka_clock_source{nullptr};
}

auto get_kafka_time_source() noexcept -> KafkaTimeSource &
{
  std::invoke([] {
    if (kafka_clock_source == nullptr) {
      static RemoteKafkaTimeSource clock_source;
      kafka_clock_source = &clock_source;
    }
  });

  return *kafka_clock_source;
}

auto set_kafka_time_source(KafkaTimeSource * const source) noexcept -> void
{
  kafka_clock_source = source;
}

auto KafkaClock::now() -> KafkaClock::time_point { return kafka_clock_source->now(); }

}  // namespace carma::chrono
