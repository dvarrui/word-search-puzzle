# frozen_string_literal: true

require "test_helper"

class InputTest < Test::Unit::TestCase
  test "Read words: string with words list" do
    data = "JEDI,SITH,STARWARS"
    words = WordSearchPuzzle::Input.read_words(data)
    assert_equal(data.split(","), words)
  end

  test "Read words: string with spaces between words list" do
    data = "JEDI, SITH , STARWARS"
    words = WordSearchPuzzle::Input.read_words(data)
    assert_equal(["JEDI", "SITH", "STARWARS"], words)
  end

  test "Read words: read from text file" do
    filename = File.join(__dir__, "starwars.txt")
    words = WordSearchPuzzle::Input.read_words(filename)
    assert(words.is_a?(Array))
    assert_equal(10, words.length)
  end

  # size = WordSearchPuzzle::Input.read_size(size)
  # gaps = WordSearchPuzzle::Input.read_gaps(gaps)
end
