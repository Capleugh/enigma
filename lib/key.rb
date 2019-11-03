class Key
  attr_reader :random

  def self.generate_random_number
    rand(00000..99999).to_s.rjust(5, '0')
    # require "pry"; binding.pry
  end

  def initialize(random)
    @random = random
    # require "pry"; binding.pry
  end

  def generate_key
    # require "pry"; binding.pry
    split = []
    @random.chars.each_cons(2) do |number|
      split << number[0].concat(number[1])
    end
    split
  end

  def convert_key
    generate_key.map do |number|
      number.to_i
    end
  end
end
