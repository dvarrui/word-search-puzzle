require_relative "word-search-puzzle/grid"
require_relative "word-search-puzzle/strategy"

module WordSearchPuzzle
  def self.create(words: words, size: 10, gaps: [])
    words = WordSearchPuzzle.read_words(words)
    gaps = WordSearchPuzzle.read_gaps(gaps)

    grid = Grid.new(size, gaps)
    strategy = Strategy.new(words, grid)
    strategy.calculate
    strategy.grid
  end

  def self.read_words(words)
    return words if words.is_a? Array

    if File.exist?(words)
      data = File.readlines(words)
      data.map! { it.strip }
      data.delete("") 
      return data
    end

    words.split(',')
  end

  def self.read_gaps(gaps)
    return gaps if gaps.is_a? Array
    return [] if gaps.nil?

    if File.exist?(gaps)
      data = File.readlines(gaps)
      data.map! do 
        items = it.split(',')
        [ items[0].to_i, items[1].to_i ]
      end
      data.delete("") 
      return data
    end
    []
  end
end
