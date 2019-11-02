class Key
  attr_reader :random

  def self.generate_random_number
    rand(00000..99999).to_s.rjust(5, '0')
    # require "pry"; binding.pry
  end

  def initialize(random)
    @random = random
  end
end
