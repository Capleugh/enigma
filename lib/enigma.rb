class Enigma
  attr_reader :charset

  def initialize(charset)
    @charset = charset
  end

  def default_key
    Key.new(RandomNumber.generate_random_number)
  end

  def default_current_date
    Offset.new(Time.new.strftime('%d%m%y'))
  end

  def encrypt(message, key = default_key, date = default_current_date)
    encrypted_message =  Encryptor.new(message, key, date).get_encrypted_message(charset)

    {encryption: encrypted_message,
      key: key.random,
      date: date.date}
  end

  def decrypt(message, key = default_key, date = default_current_date)
    decrypted_message = Decryptor.new(message, key, date).get_decrypted_message(charset)

    {decryption: decrypted_message,
      key: key.random,
      date: date.date}
  end
end
