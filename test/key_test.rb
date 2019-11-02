require './test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def setup
    @key = Key.new
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
end
