require_relative "word-search-puzzle/grid"
require_relative "word-search-puzzle/strategy"

module WordSearchPuzzle
  def self.create(words: words, size: size, gaps: [])
    grid = Grid.new(size, gaps)
    strategy = Strategy.new(words, grid)
    strategy.calculate
    strategy.grid
  end
end

