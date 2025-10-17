require_relative "word-search-puzzle/grid"
require_relative "word-search-puzzle/input"
require_relative "word-search-puzzle/strategy"

module WordSearchPuzzle
  def self.create(words: words, size: 10, gaps: [])
    words = WordSearchPuzzle::Input.read_words(words)
    size = WordSearchPuzzle::Input.read_size(size)
    gaps = WordSearchPuzzle::Input.read_gaps(gaps)

    grid = Grid.new(size, gaps)
    strategy = Strategy.new(words, grid)
    strategy.calculate
    strategy.grid
  end
end
