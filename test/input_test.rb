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
    filename = File.join(__dir__, "files", "starwars.txt")
    words = WordSearchPuzzle::Input.read_words(filename)
    assert(words.is_a?(Array))
    assert_equal(10, words.length)
  end

  test "Read size: string" do
    rows, cols = WordSearchPuzzle::Input.read_size("8")
    assert_equal(8, rows)
    assert_equal(8, cols)

    rows, cols = WordSearchPuzzle::Input.read_size("10x20")
    assert_equal(10, rows)
    assert_equal(20, cols)
  end

  test "Read size: empty string" do
    rows, cols = WordSearchPuzzle::Input.read_size("")
    assert_equal(10, rows)
    assert_equal(10, cols)
  end

  test "Read size: nil" do
    rows, cols = WordSearchPuzzle::Input.read_size(nil)
    assert_equal(10, rows)
    assert_equal(10, cols)
  end

  test "Read gaps: from csv file" do
    filename = File.join(__dir__, "files", "ball-gaps.csv")
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
    filename = File.join(__dir__, "files", "ball-shape.txt")
    gaps = WordSearchPuzzle::Input.read_gaps(filename)
    assert(gaps.is_a?(Array))
    assert_equal(48, gaps.length)
  end

  test "Read validations: empty values" do
    errors = WordSearchPuzzle::Input.validate([], 10, 10, [])
    assert_equal(0, errors.length)
  end

  test "Read validations: force error E01" do
    words = %w[STARWARS JEDI SITH]
    errors = WordSearchPuzzle::Input.validate(words, 7, 7, [])
    assert_equal(1, errors.length)
    assert(errors[0].start_with?("E01"))
  end

  test "Read validations: force error E02" do
    words = ["file_not_found.txt"]
    errors = WordSearchPuzzle::Input.validate(words, 7, 7, [])
    assert_equal(2, errors.length)
    assert(errors[1].start_with?("E02"))
  end

  test "Read validations: force error E03" do
    words = %w[DEATH START JEDI SITH YODA OBIWAN]
    errors = WordSearchPuzzle::Input.validate(words, 5, 5, [])
    assert_equal(2, errors.length)
    assert(errors[1].start_with?("E03"))
  end

  test "Read validations: force error E04" do
    words = %w[DEATH START]
    gaps = [[6, 6]]
    errors = WordSearchPuzzle::Input.validate(words, 5, 5, gaps)
    assert_equal(1, errors.length)
    assert(errors[0].start_with?("E04"))
  end
end
