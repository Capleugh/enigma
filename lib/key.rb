class Key
  attr_reader :random

  def initialize(random)
    @random = random
  end

  def generate_key

    # call the attr_reader instead of the instance variable because stubbing only works for method calls not instance variables, duh carl.
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
