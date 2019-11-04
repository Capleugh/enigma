class Offset
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def square
    date.to_i ** 2
  end

  def last_four
    square.to_s[-4..-1]
  end

  def generate_offset
    last_four.chars.map do |number|
      number.to_i
    end
  end
end
