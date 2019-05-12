require_relative 'format'
require_relative 'sumtime'

raise 'No time intervals' if ARGV.size.zero?

time_str = ARGV[0].dup
sumtime = SumTime.new(time_str)
puts "Total time: #{sumtime.calculate_time}"
