class Key

  def self.generate_random_number
    rand(00000..99999).to_s.rjust(5, "0")
  end
end
