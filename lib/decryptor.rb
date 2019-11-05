class Decryptor
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def shifted_message_index(charset)
    message.chars.map do |letter|
      charset.find_index(letter)
    end
  end
end
