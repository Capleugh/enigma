require './test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_can_generate_date
    assert_equal '021119', Offset.generate_date
  end
end
