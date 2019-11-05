class Encryptor

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def shift
    @shift = Shift.new(key, date).create_shift
    # require "pry"; binding.pry
  end

  def initial_message_index(charset)
    message.chars.map do |letter|
      charset.find_index(letter)
    end
  end

  def shift_message_index(charset)
    initial_message_index(charset).map.with_index do |number, i|
      shift_value = shift[i % 4]
      (shift_value + number) % 27
    end
  end
end
