require './binary_translator'
require 'minitest/autorun'
require 'minitest/pride'

class BinaryTranslatorTest < Minitest::Test
  def setup
    @binary_translator = BinaryTranslator.new
  end

  def test_it_translates_lowercase_letter
    assert_equal "000001", @binary_translator.translate("a")
  end

  def test_it_translates_uppercase_letter
    assert_equal "000001", @binary_translator.translate("a")
  end

  def test_it_translates_lowercase_word
    assert_equal "010100010101010010001001001110000111",
    @binary_translator.translate("turing")
  end

  def test_it_translates_uppercase_word
    assert_equal "010100010101010010001001001110000111",
    @binary_translator.translate("TURING")
  end
end
