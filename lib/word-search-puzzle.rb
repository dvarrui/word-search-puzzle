require_relative "word-search-puzzle/strategy"

module WordSearchPuzzle
  class Builder
    attr_accessor :words, :size
  
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

