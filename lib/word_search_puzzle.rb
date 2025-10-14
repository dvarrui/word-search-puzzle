require_relative "grid"

class WordSearchPuzzle
  attr_reader :grid

  def initialize(words: words, grid_size: size)
    @words = words.sort_by { it.length }.reverse
    @size = grid_size
    @solution = false
  end

  def process
    grid = Grid.new(@size)
    @solution = find_solution(@words.dup, grid)
  end

  def find_solution(words, grid)
    return grid if words.size.zero?

    word = words.delete_at(0)
    words.delete_at(0)
    locations = get_available_locations(word)

    return false if locations.empty?
    find_solution(words, grid)
  end

  def solution?
    @solution
  end

  private

  def get_available_locations(word)
    locations = []
    (0..@size).each do |row|
      (0..@size).each |col|
        Grid.directions.keys.each do |direction|
          location = @grid.get_coords(word, row, col, direction)
          locations << location unless location.empty?
        end
    end
    locations
  end
end
