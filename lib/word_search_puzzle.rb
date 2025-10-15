require_relative "strategy"

class WordSearchPuzzle
  def initialize(words: words, size: size)
    @words = words
    @size = size
    @grid = nil
  end

  def resolv
    strategy = Strategy.new(@words, @size)
    strategy.calculate
    @grid = strategy.grid
  end

  def puzzle
    @grid
  end
end
