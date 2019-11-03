class Offset
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def square(date)
    date.to_i * date.to_i
  end

  def last_four(square)
    # require "pry"; binding.pry
    square.to_s[-4..-1]
  end
end
