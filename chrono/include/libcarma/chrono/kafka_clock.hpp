#ifndef LIBCARMA_CHRONO_KAFKA_CLOCK_HPP_
#define LIBCARMA_CHRONO_KAFKA_CLOCK_HPP_

#include <chrono>

namespace carma::chrono
{
// N.B.: KafkaClock satisfies the Clock named requirement but not the TrivialClock one.

class KafkaClock
{
public:
  using period = std::ratio<1>;
  using rep = unsigned long;
  using duration = std::chrono::duration<rep, period>;
  using time_point = std::chrono::time_point<KafkaClock>;

  // Time may not advance between subsequent calls to KafkaClock::now()
  static constexpr bool is_steady{false};

  static auto now() -> time_point;
};

class KafkaTimeSource
{
public:
  auto now() -> KafkaClock::time_point { return do_now(); };
  virtual ~KafkaTimeSource() = default;

private:
  virtual auto do_now() -> KafkaClock::time_point = 0;
};

class RemoteKafkaTimeSource : public KafkaTimeSource
{
private:
  auto do_now() -> KafkaClock::time_point override { return KafkaClock::time_point{}; }
};

auto get_kafka_time_source() noexcept -> KafkaTimeSource &;
auto set_kafka_time_source(KafkaTimeSource * const source) noexcept -> void;

}  // namespace carma::chrono

#endif  // LIBCARMA_CHRONO_KAFKA_CLOCK_HPP_
