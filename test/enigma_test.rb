require './test_helper'
require 'mocha/minitest'
require 'date'
require './lib/random_number'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/encryptor'
require './lib/decryptor'
require './lib/enigma'


class EnigmaTest < Minitest::Test
  def setup
    @date = Time.new.strftime('%d%m%y')
    @offset= Offset.new(@date)
    @offset.stubs(:date).returns('021119')
    RandomNumber.stubs(:generate_random_number).returns('96287')
    @random = RandomNumber.generate_random_number
    @key = Key.new(@random)
    @shift = Shift.new(@key, @offset)
    @encryptor = Encryptor.new('hello world', @key, @offset)
    @decryptor = Decryptor.new('ynsseicvhuk', @key, @offset)
    @charset = ('a'..'z').to_a.push(' ')
    @enigma = Enigma.new(@charset)
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_initialize
    assert_equal @charset, @enigma.charset
  end

  def test_encrypt
    expected = {encryption: 'ynsseicvhuk',
                key: '96287',
                date: '021119'}

    assert_equal expected, @enigma.encrypt('hello world', @key, @offset)
  end

  def test_decrypt
    expected = {decryption: 'hello world',
                key: '96287',
                date: '021119'}

    assert_equal expected, @enigma.decrypt('ynsseicvhuk', @key, @offset)
  end

  def test_it_can_default_values
    expected = {
      encryption: 'ynsseicvhuk',
      key: @key.random,
      date: Time.new.strftime('%d%m%y')
    }
    assert_equal expected, @enigma.encrypt('hello world')
  end
end
