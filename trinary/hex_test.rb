require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require_relative 'hex'

class HexTest < Minitest::Test
  def test_hex_1_is_decimal_1
    assert_equal 1, Hex.new('1').to_decimal
  end

  def test_hex_2_is_decimal_2
    assert_equal 2, Hex.new('2').to_decimal
  end

  def test_hex_1AeE_is_decimal_6894
    assert_equal 6894, Hex.new('1AeE').to_decimal
  end

  def test_hex_AbC_is_decimal_2748
    assert_equal 2748, Hex.new('AbC').to_decimal
  end

  def test_hex_7F30_is_decimal_32560
    assert_equal 32560, Hex.new('7F30').to_decimal
  end

  def test_hex_1122000120_is_32091
    assert_equal 73_584_869_664, Hex.new('1122000120').to_decimal
  end

  def test_invalid_hex_is_decimal_0
    assert_equal 0, Hex.new('carrot').to_decimal
  end

  def test_invalid_hex_with_digits_is_decimal_0
    assert_equal 0, Hex.new('0ga1b2c').to_decimal
  end
end