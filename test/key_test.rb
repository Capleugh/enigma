require './test_helper'
require './lib/key'
require './lib/random'
require 'mocha/minitest'

class KeyTest < Minitest::Test
  def setup
    random = Random.new
    @key = Key.new(random)
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_random_number_length
    assert_equal 5, Key.generate_random_number.length
  end

  def test_it_is_a_string
    assert_instance_of String, Key.generate_random_number
  end

  def test_random_number_can_be_mocked
    Key.expects(:generate_random_number).returns('96287')

    assert_equal '96287', Key.generate_random_number
  end

  def test_initialize
    @key.stubs(:random).returns('96287')

    assert_equal '96287', @key.random
  end
end
