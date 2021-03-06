require './test_helper'
require 'mocha/minitest'
require './lib/random_number'
require './lib/key'
require './lib/offset'
require './lib/shift'

class ShiftTest < Minitest::Test
  def setup
    date = Time.new.strftime('%d%m%y')
    @offset = Offset.new(date)
    @offset.stubs(:date).returns('021119')
    RandomNumber.stubs(:generate_random_number).returns('96287')
    @random = RandomNumber.generate_random_number
    @key = Key.new(@random)
    @shift = Shift.new(@key, @offset)
    @charset = ('a'..'z').to_a.push(' ')
  end

  def test_initialize
    assert_instance_of Key, @shift.key
    assert_instance_of Offset, @shift.offset
  end

  def test_key_and_offset_can_be_merged
    expected = [98, 63, 34, 88]

    assert_equal expected, @shift.create_shift
  end
end
