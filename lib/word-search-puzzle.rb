require_relative "word-search-puzzle/strategy"

module WordSearchPuzzle
  def self.create(words: words, size: size)
    strategy = Strategy.new(words, size)
    strategy.calculate
    strategy.grid
  end
end

