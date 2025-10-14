# frozen_string_literal: true

require "test_helper"

class GridTest < Test::Unit::TestCase
  test "Get coords for 1 word" do
    grid = Grid.new(10)
    location = grid.get_coords("black", 1, 2, :e)
    assert_equal(5, location.length)

    coord = location[0]
    assert_equal(1, coord.row)
    assert_equal(2, coord.col)
    assert_equal('b', coord.data)

    coord = location[1]
    assert_equal(1, coord.row)
    assert_equal(3, coord.col)
    assert_equal('l', coord.data)

    coord = location[2]
    assert_equal(1, coord.row)
    assert_equal(4, coord.col)
    assert_equal('a', coord.data)
  end
end
