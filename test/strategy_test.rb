# frozen_string_literal: true

require "test_helper"

class StrategyTest < Test::Unit::TestCase
  test "Strategy: solution" do
    words = %w[STARWARS OBIWAN LUKE VADER R2D2 C3PO LEIA YODA EMPERADOR SITH]
    grid = WordSearchPuzzle::Grid.new(10, [])
    strategy = WordSearchPuzzle::Strategy.new(words, grid)
    strategy.calculate
    puzzle = strategy.grid
    assert(puzzle.is_a?(WordSearchPuzzle::Grid))
  end

  test "Strategy: solution not found" do
    words = %w[STARWARS OBIWAN LUKE VADER R2D2 C3PO LEIA YODA EMPERADOR SITH]
    grid = WordSearchPuzzle::Grid.new(8, [])
    strategy = WordSearchPuzzle::Strategy.new(words, grid)
    strategy.calculate
    puzzle = strategy.grid
    assert(puzzle.nil?)
  end
end
