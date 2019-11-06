require './lib/random_number'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/encryptor'
require './lib/enigma'
require 'date'

message_file = ARGV[0]
encrypted_file = ARGV[1]

msg_file = File.open(message_file ,'r')
initial_message = msg_file.read.chomp
charset = ('a'..'z').to_a.push(' ')
enigma = Enigma.new(charset)

enigma.encrypt(initial_message)
puts "Created #{encrypted_file} with the key #{enigma.encrypt(initial_message)[:key]} and date #{enigma.encrypt(initial_message)[:date]}."
msg_file.close


enc_file = File.open(encrypted_file, 'w')
charset = ('a'..'z').to_a.push(' ')
enigma = Enigma.new(charset)
enc_file.write(enigma.encrypt(initial_message)[:encryption])
enc_file.close
# encrypted message should be written to encrypted.txt file and the terminal should outpu file name key and date
