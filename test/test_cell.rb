# frozen_string_literal: true

require "test_helper"

class CellTest < Test::Unit::TestCase
  test "New cell" do
    cell = Cell.new
    assert_equal(true, cell.empty?)

    # assert do
    #  ::Word::Search::Puzzle.const_defined?(:VERSION)
    # end
  end

  test "Push and pull" do
    cell = Cell.new
    cell.push("A")
    assert_equal("A", cell.data)
    assert_equal(false, cell.empy?)
    data = cell.push
    assert_equal(true, cell.empy?)
    assert_equal("A", data)
  end
end
