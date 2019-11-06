class Enigma
  attr_reader :charset

  def initialize(charset)
    @charset = charset
  end

  def encrypt(message, key, date)
    encrypted_message =  Encryptor.new(message, key, date).get_encrypted_message(charset)

    {encryption: encrypted_message,
      key: key.random,
      date: date.date}
  end

  def decrypt(message, key, date)
    decrypted_message = Decryptor.new(message, key, date).get_decrypted_message(charset)

    {decryption: decrypted_message,
      key: key.random,
      date: date.date}
  end
end
