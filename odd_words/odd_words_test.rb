require 'minitest/autorun'

require_relative "odd_words"

class OddWordTest < MiniTest::Test
  def test_happy_path
    actual = OddWord.new("whats the matter with kansas.").reverse
    assert_equal "whats eht matter htiw kansas.", actual
  end

  def test_many_spaces_between_words
    expected = "Whats eht matter htiw kansas."
    assert_equal expected, OddWord.new("Whats     the  matter   with kansas    .").reverse
  end

  def test_many_spaces_between_words
    expected = "What tuoba my WMB X6."
    assert_equal expected, OddWord.new("What about my BMW X6.").reverse
  end
end
