require './test_helper'
require 'mocha/minitest'
require './lib/random_number'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/encryptor'
require './lib/decryptor'

class DecryptorTest < Minitest::Test
  def setup
    date = Time.new.strftime('%d%m%y')
    @offset= Offset.new(date)
    @offset.stubs(:date).returns('021119')
    RandomNumber.stubs(:generate_random_number).returns('96287')
    @random = RandomNumber.generate_random_number
    @key = Key.new(@random)
    @shift = Shift.new(@key, @offset)
    @encryptor = Encryptor.new('hello world', @key, @offset)
    @decryptor = Decryptor.new('ynsseicvhuk', @key, @offset)
    @charset = ('a'..'z').to_a.push(' ')
  end

  def test_it_exists
    assert_instance_of Decryptor, @decryptor
  end

  def test_initialize
    assert_equal 'ynsseicvhuk', @decryptor.message
    assert_instance_of Key, @decryptor.key
    assert_instance_of Offset, @decryptor.date
  end

  def test_it_can_find_message_index
    expected = [24, 13, 18, 18, 4, 8, 2, 21, 7, 20, 10]

    assert_equal expected, @decryptor.shifted_message_index(@charset)
  end

  def test_it_can_unshift_message_index
    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    assert_equal expected, @decryptor.unshift_message_index(@charset)
  end
end
