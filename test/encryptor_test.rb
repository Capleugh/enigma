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
    @charset = ('a'..'z').to_a.push(' ')
    @encryptor = Encryptor.new('hello world', @random, @offset)
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_initialize
    assert_equal 'hello world', @encryptor.message
    assert_equal '96287', @encryptor.key
    assert_instance_of Offset, @encryptor.date
  end
end
