require './test_helper'
require 'mocha/minitest'
require './lib/random_number'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/encryptor'

class EncyptionTest < Minitest::Test
  def setup
    date = Time.new.strftime('%d%m%y')
    @offset= Offset.new(date)
    @offset.stubs(:date).returns('021119')
    RandomNumber.stubs(:generate_random_number).returns('96287')
    @random = RandomNumber.generate_random_number
    @key = Key.new(@random)
    @shift = Shift.new(@key, @offset)
    @encryptor = Encryptor.new('hello world', @key, @offset)
    @charset = ('a'..'z').to_a.push(' ')
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_initialize
    assert_equal 'hello world', @encryptor.message
    assert_instance_of Key, @encryptor.key
    assert_instance_of Offset, @encryptor.date
    assert_equal [98, 63, 34, 88], @encryptor.shift
  end

  def test_it_can_find_message_index
    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    assert_equal expected, @encryptor.initial_message_index(@charset)
  end

  def test_it_can_shift_message_index
    expected = [24, 13, 18, 18, 4, 8, 2, 21, 7, 20, 10]

    @encryptor.initial_message_index(@charset)

    assert_equal expected, @encryptor.shift_message_index(@charset)
  end

  def test_it_can_return_letter_associated_with_shifted_index
    expected = ['y', 'n', 's', 's', 'e', 'i', 'c', 'v', 'h', 'u', 'k']
    @encryptor.shift_message_index(@charset)

    assert_equal expected, @encryptor.find_letters_at_shifted_index(@charset)
  end

  def test_encrypted_message
    assert_equal 'ynsseicvhuk', @encryptor.get_encrypted_message(@charset)
  end
end
