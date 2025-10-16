require_relative "word-search-puzzle/strategy"

module WordSearchPuzzle
  def self.create(words: words, size: size, locks: [])
    strategy = Strategy.new(words, size, locks)
    strategy.calculate
    strategy.grid
  end
end

