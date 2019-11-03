class Key
  attr_reader :random

  def initialize(random)
    @random = random
  end

  def generate_key
    split = []
    random.chars.each_cons(2) do |number|
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
