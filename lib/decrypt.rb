require './lib/random_number'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/encryptor'
require './lib/decryptor'
require './lib/enigma'

require 'date'

encrypted_file = ARGV[0]


encr_file = File.open(encrypted_file, 'r')
encrypted_message = encr_file.read.chomp
charset = ('a'..'z').to_a.push(' ')
enigma = Enigma.new(charset)
encr_file.close

decrypted_file = ARGV[1]
key = Key.new(ARGV[2])
date = Offset.new(ARGV[3])
decr_file = File.open(decrypted_file, 'w')
charset = ('a'..'z').to_a.push(' ')
enigma = Enigma.new(charset)
# are you missing something that decryption needs?
decryption = enigma.decrypt(encrypted_message, key, date)
decryption[:decryption]
decr_file.write(decryption[:decryption])
puts "Created '#{decrypted_file}' with the key #{key.random} and date #{date.date.to_s}"
# require "pry"; binding.pry
decr_file.close
