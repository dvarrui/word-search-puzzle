require_relative "word-search-puzzle/grid"
require_relative "word-search-puzzle/strategy"

module WordSearchPuzzle
  def self.create(words: words, size: size, locks: [])
    grid = Grid.new(size, locks)
    strategy = Strategy.new(words, grid)
    strategy.calculate
    strategy.grid
  end
end

