require './test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test
  def setup
    @date = Time.new.strftime('%d%m%y')
    @sample_offset = Offset.new('021119')
    @offset = Offset.new(@date)
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_initialize
    assert_equal @date, @offset.date
  end

  def test_date_can_be_squared
    expected = @date.to_i * @date.to_i

    assert_equal expected, @offset.square(@date)
    assert_equal 446_012_161, @sample_offset.square('021119')
  end

  ### come back and figure out how to mock and stub ####
  
  def test_it_can_take_last_four_digits
    # squared = @date.to_i * @date.to_i

    # assert_equal squared.to_s[-4, -1], @offset.last_four(squared)
    assert_equal "2161", @sample_offset.last_four(446_012_161)
  end

  def test_it_can_convert_to_an_array_of_integers
    assert_equal [2, 1, 6, 1], @sample_offset.generate_offset("2161")
  end
end
