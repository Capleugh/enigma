require './test_helper'
require './lib/random_number'

class RandomNumberTest < Minitest:: Test
  def test_random_number_length
    assert_equal 5, RandomNumber.generate_random_number.length
  end

  def test_it_is_a_string
    assert_instance_of String, RandomNumber.generate_random_number
  end

  def test_random_number_generator_can_be_stubbed
    RandomNumber.stubs(:generate_random_number).returns('96287')
    assert_equal '96287', RandomNumber.generate_random_number
  end
end
