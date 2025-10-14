# frozen_string_literal: true

require "test_helper"

class Word::Search::PuzzleTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Word::Search::Puzzle.const_defined?(:VERSION)
    end
  end

  # test "something useful" do
  #  assert_equal("expected", "actual")
  # end
end
