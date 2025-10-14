require_relative "grid"

class WordSearchPuzzle
  attr_reader :grid

  def initialize(words: words, size: size)
    @words = words.sort_by { it.length }.reverse
    @size = size
    @solution = false
    @grid = nil
  end

  def solution?
    @solution
  end

  def process
    grid = Grid.new(@size)
    @grid = find_solution(@words.dup, grid)
  end

  def find_solution(words, grid)
    return grid if words.size.zero?

    # Choose one word
    word = words.delete_at(0)
    words.delete_at(0)
    available_locations = get_available_locations(word)
    if available_locations.empty?
      @solution = false
      return nil
    end

    available_locations.shuffle!
    available_locations.each do |selected_location|
      grid.set_coords(selected_location)
      solution = find_solution(words, grid)
      if solution.empty?
        grid.unset_coords(selected_location)
      else
        return solution
      end
    end

    grid
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
