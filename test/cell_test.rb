# frozen_string_literal: true

require "test_helper"

class CellTest < Test::Unit::TestCase
  test "new" do
    cell = Cell.new
    assert_equal(true, cell.empty?)
    assert_equal(0, cell.count)
    assert_equal(false, cell.in_use?)

    # assert do
    #  ::Word::Search::Puzzle.const_defined?(:VERSION)
    # end
  end

  test "new and pop" do
    cell = Cell.new
    assert_raise { cell.pop }
    assert_raise_message("Cell.pop: No data!") { cell.pop }
  end

  test "1 push" do
    cell = Cell.new
    assert_equal(false, cell.in_use?)

    cell.push("A")
    assert_equal("A", cell.data)
    assert_equal(1, cell.count)
    assert_equal(false, cell.empty?)
    assert_equal(true, cell.in_use?)
  end

  test "push A and push B" do
    cell = Cell.new
    assert_equal(false, cell.in_use?)

    cell.push("A")
    assert_equal("A", cell.data)

    assert_raise { cell.push 'B' }
    assert_raise_message('Cell.push: new data(B) is not equal to current data(A)!') { cell.push 'B' }
  end

  test "1 push and 1 pop" do
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

  test "gap" do
    cell = Cell.new
    assert_equal(false, cell.gap?)
    cell.gap!
    assert_equal(true, cell.gap?)
  end
end
