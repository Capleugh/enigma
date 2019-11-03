require './test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test
  def setup
    date = Time.new.strftime('%d%m%y')
    @offset = Offset.new(date)
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_initialize
    @offset.stubs(:date).returns('021119')

    assert_equal '021119', @offset.date
  end

  def test_date_can_be_squared
    assert_equal 446_012_161, @offset.square('021119')
  end

  def test_it_can_take_last_four_digits
    assert_equal "2161", @offset.last_four(446_012_161)
  end

  def test_it_can_convert_to_an_array_of_integers
    assert_equal [2, 1, 6, 1], @offset.generate_offset("2161")
  end
end
