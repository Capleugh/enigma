require './test_helper'
require './lib/key'
require './lib/random_number'
require 'mocha/minitest'

class KeyTest < Minitest::Test
  def setup
    random = RandomNumber.generate_random_number
    @key = Key.new(random)
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_initialize
    @key.stubs(:random).returns('96287')

    assert_equal '96287', @key.random
  end

  def test_it_can_generate_key
    @key.stubs(:random).returns('96287')

    assert_equal ['96', '62', '28', '87'], @key.generate_key
  end

  def test_it_can_convert_strings_to_integers
    @key.stubs(:generate_key).returns(['96', '62', '28', '87'])

    assert_equal [96, 62, 28, 87], @key.convert_key
  end
end
