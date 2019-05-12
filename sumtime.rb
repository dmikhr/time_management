# methods for calculating time based on time ranges supplied as string
class SumTime
  include Format
  attr_accessor :output_format

  def initialize(time_str)
    @time_str = time_str
    @output_format = :float_hr
    time_in_blocks
  end

  def calculate_time
    @all_time_min = 0
    @time_blocks.each { |time_block| @all_time_min += time_block_to_sec(time_block) }
    format_time
  end

  private

  def time_in_blocks
    @time_str.gsub!(' - ', '_')
    @time_blocks = @time_str.split(' ')
    @time_blocks.map! { |time_block| time_block.split('_') }
  end

  def format_time
    Format::TIME[@output_format].call(@all_time_min)
  end

  def time_block_to_sec(time_block)
    time_block.size == 1 ? time_block[0].to_i * 60 : time_diff(time_block[0], time_block[1])
  end

  def time_diff(timestamp1, timestamp2)
    hr1, min1 = hr_min_split(timestamp1)
    hr2, min2 = hr_min_split(timestamp2)
    # 22:30 - 0:30
    hr2 += 24 if hr1 > hr2
    timestamp1_min = to_sec(hr1, min1)
    timestamp2_min = to_sec(hr2, min2)
    timestamp2_min - timestamp1_min
  end

  def hr_min_split(timestamp)
    hr, min = timestamp.split(':')
    [hr.to_i, min.to_i]
  end

  def to_sec(hr, min)
    hr * 3600 + min * 60
  end
end
