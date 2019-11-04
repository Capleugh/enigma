require './test_helper'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  def setup
    @encryptor = Encryptor.new('hello world', '96287', '021119')
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_initialize
    assert_equal 'hello world', @encryptor.message
    assert_equal '96287', @encryptor.key
    assert_equal '021119', @encryptor.date
  end
end
