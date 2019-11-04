require './test_helper'
require 'date'
require './lib/enigma'
require './lib/key'
require './lib/offset'


class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  # def test_encrypt
  #   expected = {encryption: "keder ohulw",
  #               key: '96287',
  #               date: '021119'}
  #
  #   assert_equal expected, @enigma.encrypt("hello world", '96287', '021119')
  # end
end
