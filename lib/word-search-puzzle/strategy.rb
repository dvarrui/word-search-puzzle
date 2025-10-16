
require_relative "grid"

class Strategy
  attr_reader :grid

  def initialize(words, size)
    # Sort words from longest to smallest
    @words = words.sort_by { it.length }.reverse
    @size = size
    @grid = nil
  end

  def solution?
    !@grid.nil?
  end

  def calculate
    initial_grid = Grid.new(@size)
    @grid = find_solution(@words.clone, initial_grid.clone)
  end

  private

  def find_solution(words, grid)
    # Take the first word
    word = words.delete_at(0)
    available_word_locations = get_available_locations(word, grid)
    return nil if available_word_locations.empty? # No solution

    available_word_locations.shuffle!
    available_word_locations.each do |sequence|
      grid.set_sequence(sequence) # Push word into grid location
      return grid if words.empty? # Solved puzzle. No more words to push

      resolved_grid = find_solution(words.clone, grid.clone) # Find solution recursively
      if resolved_grid
        return resolved_grid # <new_grid> contains the solved puzzle
      else
        # The selected <sequence> of the word does not help to solve the puzzle.
        # 1. Restore <grid> content
        # 2. And try other sequence
        grid.unset_sequence(sequence)
      end
    end
    if words.empty?
      return grid # All the words are placed
    else
      return nil # All possibilities have been tried and there are still words left unplaced.
    end
  end

  def get_available_locations(word, grid)
    locations = []
    (0...@size).each do |row|
      (0...@size).each do |col|
        Grid.directions.keys.each do |direction|
          location = grid.find_sequence(word, row, col, direction)
          locations << location unless location.empty?
        end
      end
    end
    locations
  end
end