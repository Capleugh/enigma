class Encryptor

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def shift
    Shift.new(key, date).create_shift
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

  def find_letters_at_shifted_index(charset)
    shift_message_index(charset).map do |number|
       charset[number]
    end
  end

  def get_encrypted_message(charset)
    find_letters_at_shifted_index(charset).join
  end
end
