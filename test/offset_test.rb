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
end
