require_relative "word-search-puzzle/grid"
require_relative "word-search-puzzle/input"
require_relative "word-search-puzzle/strategy"

module WordSearchPuzzle
  def self.create(words: words, size: 10, gaps: [])
    # Read inputs values
    words = WordSearchPuzzle::Input.read_words(words)
    size = WordSearchPuzzle::Input.read_size(size)
    gaps = WordSearchPuzzle::Input.read_gaps(gaps)

    # Validate inputs values
    errors = WordSearchPuzzle::Input.validations(words, size, gaps)
    unless errors.empty?
      puts "Unable to create puzzle:"
      errors.each_with_index { |message, index| puts "#{index + 1}. #{message}"}
      exit 1
    end

    # Create the grid ant try to find a puzzle
    grid = Grid.new(size, gaps)
    strategy = Strategy.new(words, grid)
    strategy.calculate
    strategy.grid
  end
end
