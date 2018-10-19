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

  def test_it_translates_space_as_six_zeros
    assert_equal "000000", @binary_translator.translate(" ")
  end

  def test_it_ignores_anything_that_is_not_letter_or_space
    assert_equal "", @binary_translator.translate("!@{$#%^&*()}")
  end

  def test_it_translate_a_sentence
    assert_equal "001000000101001100001100001111000000010111001111010010001100000100",
    @binary_translator.translate("Hello World!")
  end

  def test_it_translate_binary_to_text
    assert_equal "hello world",
    @binary_translator.translate_to_text("001000000101001100001100001111000000010111001111010010001100000100")
  end
end
