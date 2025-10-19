# frozen_string_literal: true

require "test_helper"

class InputTest < Test::Unit::TestCase
  test "Read words: string with words list" do
    data = "JEDI,SITH,STARWARS"
    words = WordSearchPuzzle::Input.read_words(data)
    assert_equal(data.split(","), words)
  end

  test "Read words: string with spaces between words list" do
    data = "JEDI, SITH , STARWARS "
    words = WordSearchPuzzle::Input.read_words(data)
    assert_equal(["JEDI", "SITH", "STARWARS"], words)
  end

  test "Read words: from text file" do
    filename = File.join(__dir__, "starwars.txt")
    words = WordSearchPuzzle::Input.read_words(filename)
    assert(words.is_a?(Array))
    assert_equal(10, words.length)
  end

  test "Read size: string" do
    size = WordSearchPuzzle::Input.read_size("8")
    assert_equal(8, size)
  end

  test "Read size: empty string" do
    size = WordSearchPuzzle::Input.read_size("")
    assert_equal(0, size)
  end

  test "Read size: nil" do
    size = WordSearchPuzzle::Input.read_size(nil)
    assert_equal(10, size)
  end

  test "Read gaps: from csv file" do
    filename = File.join(__dir__, "ball-gaps.csv")
    gaps = WordSearchPuzzle::Input.read_gaps(filename)
    assert(gaps.is_a?(Array))
    assert_equal(48, gaps.length)
  end

  test "Read gaps: unknown file" do
    data = "unkown.file"
    gaps = WordSearchPuzzle::Input.read_gaps(data)
    assert(gaps.is_a?(Array))
    assert_equal(0, gaps.length)
  end

  test "Read gaps: from shape file" do
    filename = File.join(__dir__, "ball-shape.txt")
    gaps = WordSearchPuzzle::Input.read_gaps(filename)
    assert(gaps.is_a?(Array))
    assert_equal(48, gaps.length)
  end
end
