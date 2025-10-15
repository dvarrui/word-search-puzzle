# frozen_string_literal: true

require "test_helper"

class CellTest < Test::Unit::TestCase
  test "New" do
    cell = Cell.new
    assert_equal(true, cell.empty?)
    assert_equal(0, cell.count)

    # assert do
    #  ::Word::Search::Puzzle.const_defined?(:VERSION)
    # end
  end

  test "Push" do
    cell = Cell.new
    cell.push("A")

    assert_equal("A", cell.data)
    assert_equal(1, cell.count)
    assert_equal(false, cell.empty?)
  end

  test "Push and pop" do
    cell = Cell.new
    cell.push("A")

    assert_equal("A", cell.data)
    assert_equal(1, cell.count)
    assert_equal(false, cell.empty?)

    data = cell.pop
    assert_equal("A", data)
    assert_equal(0, cell.count)
    assert_equal(true, cell.empty?)
  end
end
