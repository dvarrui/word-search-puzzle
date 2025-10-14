# frozen_string_literal: true

require "test_helper"

class GridTest < Test::Unit::TestCase
  test "Get coords for 1 word east" do
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

  test "Fail getting coords for 1 word east" do
    grid = Grid.new(3)
    location = grid.get_coords("black", 1, 2, :e)
    assert_equal(0, location.length)
    assert_equal([], location)
  end

  test "Get coords for 1 word south" do
    grid = Grid.new(10)
    location = grid.get_coords("black", 1, 2, :s)
    assert_equal(5, location.length)

    coord = location[0]
    assert_equal(1, coord.row)
    assert_equal(2, coord.col)
    assert_equal('b', coord.data)

    coord = location[1]
    assert_equal(2, coord.row)
    assert_equal(2, coord.col)
    assert_equal('l', coord.data)

    coord = location[2]
    assert_equal(3, coord.row)
    assert_equal(2, coord.col)
    assert_equal('a', coord.data)
  end

  test "Set coords for 2 word overlap east" do
    grid = Grid.new(5)
    location = grid.get_coords("black", 0, 0, :e)
    assert_equal(5, location.length)
    grid.set_coords(location)

    location = grid.get_coords("blue", 0, 0, :s)
    assert_equal(4, location.length)
    grid.set_coords(location)

    location = grid.get_coords("red", 1, 0, :e)
    assert_equal(0, location.length)
  end
end
