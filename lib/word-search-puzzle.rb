require_relative "strategy"

module WordSearchPuzzle
  class WordSearchPuzzle
    def initialize(words: words, size: size)
      @words = words
      @size = size
      @grid = nil
    end
  
    def create_puzzle
      strategy = Strategy.new(@words, @size)
      strategy.calculate
      @grid = strategy.grid
    end
  
    def puzzle
      @grid
    end
  end  
end

