class Encryptor
  attr_reader :message, :key, :date, :shift

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @shift = []
  end

  def access_shift(shift)
    @shift << shift.create_shift
  end


  def link_message(charset)
    message.chars.find_all do |letter|
      charset.find_all do |char|
        letter.ord == char.ord
      end
    end
  end

  
end
