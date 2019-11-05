class Decryptor
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def shift
    @shift = Shift.new(key, date).create_shift
  end

  def shifted_message_index(charset)
    message.chars.map do |letter|
      charset.find_index(letter)
    end
  end

  def unshift_message_index(charset)
    shifted_message_index(charset).map.with_index do |number, i|
      shift_value = shift[i % 4]
      (number - shift_value) % 27
    end
  end

  def unshifted_message_index(charset)
    unshift_message_index(charset).map do |number|
      charset[number]
    end
  end

  def get_decrypted_message(charset)
    unshifted_message_index(charset).join
  end
end
