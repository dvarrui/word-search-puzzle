require_relative "word-search-puzzle/grid"
require_relative "word-search-puzzle/input"
require_relative "word-search-puzzle/strategy"

module WordSearchPuzzle
  def self.create(words: [], size: "10x10", gaps: [])
    # Read input values
    words = WordSearchPuzzle::Input.read_words(words)
    rows, cols = WordSearchPuzzle::Input.read_size(size)
    gaps = WordSearchPuzzle::Input.read_gaps(gaps)

    # Validate input values
    errors = WordSearchPuzzle::Input.validate(words, rows, cols, gaps)
    unless errors.empty?
      puts "Unable to create puzzle:"
      errors.each_with_index { |message, index| puts "#{index + 1}. #{message}" }
      exit 1
    end

    # Create the grid ant try to find a puzzle
    grid = Grid.new(rows, cols, gaps)
    strategy = Strategy.new(words, grid)
    strategy.calculate
    strategy.grid
  end
end
