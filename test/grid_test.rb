# frozen_string_literal: true

require "test_helper"

class GridTest < Test::Unit::TestCase
  test "Find sequence for 1 word east" do
    grid = Grid.new(10)
    sequence = grid.find_sequence("black", 1, 2, :e)
    assert_equal(5, sequence.length)

    coord = sequence[0]
    assert_equal(1, coord.row)
    assert_equal(2, coord.col)
    assert_equal('b', coord.data)

    coord = sequence[1]
    assert_equal(1, coord.row)
    assert_equal(3, coord.col)
    assert_equal('l', coord.data)

    coord = sequence[2]
    assert_equal(1, coord.row)
    assert_equal(4, coord.col)
    assert_equal('a', coord.data)
  end

  test "Fail finding sequence for 1 word east" do
    grid = Grid.new(3)
    sequence = grid.find_sequence("black", 1, 2, :e)
    assert_equal(0, sequence.length)
    assert_equal([], sequence)
  end

  test "Get sequence for 1 word south" do
    grid = Grid.new(10)
    sequence = grid.find_sequence("black", 1, 2, :s)
    assert_equal(5, sequence.length)

    coord = sequence[0]
    assert_equal(1, coord.row)
    assert_equal(2, coord.col)
    assert_equal('b', coord.data)

    coord = sequence[1]
    assert_equal(2, coord.row)
    assert_equal(2, coord.col)
    assert_equal('l', coord.data)

    coord = sequence[2]
    assert_equal(3, coord.row)
    assert_equal(2, coord.col)
    assert_equal('a', coord.data)
  end

  test "Set sequence for 2 overlaped words east" do
    grid = Grid.new(5)
    sequence = grid.find_sequence("black", 0, 0, :e)
    assert_equal(5, sequence.length)
    grid.set_sequence(sequence)

    sequence = grid.find_sequence("blue", 0, 0, :s)
    assert_equal(4, sequence.length)
    grid.set_sequence(sequence)

    sequence = grid.find_sequence("red", 1, 0, :e)
    assert_equal(0, sequence.length)
  end

  test "Unset sequence with 2 overlaped words " do
    grid = Grid.new(5)
    sequence1 = grid.find_sequence("black", 0, 0, :e)
    grid.set_sequence(sequence1)

    sequence2 = grid.find_sequence("red", 0, 1, :e)
    assert_equal(0, sequence2.length)

    grid.unset_sequence(sequence1)
    sequence2 = grid.find_sequence("red", 0, 1, :e)
    assert_equal(3, sequence2.length)
  end
end
