require 'test/unit'
require_relative 'format'
require_relative 'sumtime'

# tests for SumTime
class SumTimeTest < Test::Unit::TestCase
  def test_simple_time_range
    time_string = '5:40 - 6:40'
    sumtime = SumTime.new(time_string)
    assert_equal('1.0', sumtime.calculate_time)
  end

  # when time range ends on the next day
  def test_time_range_new_day
    time_string = '22:30 - 0:30'
    sumtime = SumTime.new(time_string)
    assert_equal('2.0', sumtime.calculate_time)
  end

  def test_time_range_complex
    time_string = '5:40 - 7:20 12:00 - 13:25 20 15:05 - 15:30 -10 18:30 - 19:50'
    sumtime = SumTime.new(time_string)
    assert_equal('5.0', sumtime.calculate_time)
  end

  def test_time_range_complex_new_day
    time_string = '30 22:00 - 23:30 23:40 - 0:40 1:30 - 2:30 -30'
    sumtime = SumTime.new(time_string)
    assert_equal('3.5', sumtime.calculate_time)
  end

  def test_time_string1
    time_string = '10:30 - 11:25 11:45 - 12:30 12:30 - 13:40'
    sumtime = SumTime.new(time_string)
    assert_equal('2.8', sumtime.calculate_time)
  end

  def test_time_string2
    time_string = '10:30 - 11:25 11:45 - 12:30 20 12:30 - 13:40 -5'
    sumtime = SumTime.new(time_string)
    assert_equal('3.1', sumtime.calculate_time)
  end

  def test_time_string3
    time_string = '9:24 - 13:17 13:38 - 13:56 15'
    sumtime = SumTime.new(time_string)
    assert_equal('4.4', sumtime.calculate_time)
  end

  # testting additional output time formats
  def test_hr_min_rus
    time_string = '22:30 - 1:00'
    sumtime = SumTime.new(time_string)
    sumtime.output_format = :hr_min_rus
    assert_equal('02 ч. 30 мин.', sumtime.calculate_time)
  end

  def test_hr_min_en
    time_string = '22:30 - 1:00'
    sumtime = SumTime.new(time_string)
    sumtime.output_format = :hr_min_en
    assert_equal('02 hr. 30 min.', sumtime.calculate_time)
  end

  def test_clock_format
    time_string = '22:30 - 1:00'
    sumtime = SumTime.new(time_string)
    sumtime.output_format = :clock
    assert_equal('02:30', sumtime.calculate_time)
  end
end
