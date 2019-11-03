require './test_helper'
require './lib/key'
require 'mocha/minitest'

class KeyTest < Minitest::Test
  def setup
    random = Key.generate_random_number
    @key = Key.new(random)
    @key_2 = Key.new('21456')
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
    @key.expects(:random).returns('96287')

    assert_equal '96287', @key.random
    assert_equal '21456', @key_2.random
  end



  ##### come back and figure out why this isn't working #####


  def test_it_can_generate_key
    expected = ['96', '62', '28', '87']
    @key.expects(:generate_key).returns(expected)

    assert_equal expected, @key.generate_key
    assert_equal ['21', '14', '45', '56'], @key_2.generate_key
  end

  def test_it_can_convert_strings_to_integers
    # mock and stub this
    assert_equal [21, 14, 45, 56], @key_2.convert_key
  end
end
