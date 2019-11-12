class Sienazis
  def initialize
    @length = nil
    @number_of_jumps = nil
    @jump_lengths = []
    @result = 0
    @errors = []
  end

  def perform
    read_config
    validate_config
    calculate
    output_result(@result)
  end

  def read_config
    File.open('sienaz.in', 'r') do |file|
      @length, @number_of_jumps = file.readline
                                      .split(' ')
                                      .map(&:to_i)
      @jump_lengths = file.readline
                          .split(' ')
                          .map(&:to_i)
                          .first(@number_of_jumps)
    end
  rescue Errno::ENOENT => e
    raise "Caught the exception: #{e}"
  end

  def validate_config
    validate_length
    validate_number_of_jumps
    validate_jump_lengths
  end

  def validate_length
    return if @length.positive? && @length <= 30

    raise 'Caught the exception: N is not valid'
  end

  def validate_number_of_jumps
    return if @number_of_jumps.positive? && @number_of_jumps <= 5

    raise 'Caught the exception: K is not valid'
  end

  def validate_jump_lengths
    return unless @jump_lengths.empty? ||
                  @jump_lengths.size != @number_of_jumps ||
                  @jump_lengths.select { |j| j > @length }.any?

    raise 'Caught the exception: L is not valid'
  end

  def calculate
    1.upto(@number_of_jumps) do |i|
      @result += @jump_lengths.repeated_permutation(i)
                              .to_a
                              .map(&:sum)
                              .select { |s| (@length % s).zero? }
                              .count
    end
  end

  def output_result(output)
    File.open('sienaz.out', 'w') do |file|
      file.write output
      return 'results available in sienaz.out'
    end
  end
end
