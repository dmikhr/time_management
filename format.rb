# time formats stored in hash
module Format
  # seconds to timestamp
  # https://gist.github.com/shunchu/3175001
  format_timestamp = ->(t, str_format) { Time.at(t).utc.strftime(str_format) }
  TIME = {
    float_hr: ->(time) { format('%.1f', (time / 3600.0)) },
    hr_min_rus: ->(time) { format_timestamp.call(time, '%H ч. %M мин.') },
    hr_min_en: ->(time) { format_timestamp.call(time, '%H hr. %M min.') },
    clock: ->(time) { format_timestamp.call(time, '%H:%M') }
  }.freeze
end
