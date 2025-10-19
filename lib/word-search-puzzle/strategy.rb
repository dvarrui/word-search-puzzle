require_relative "grid"

module WordSearchPuzzle
  class Strategy
    def initialize(words, grid)
      # Sort words from longest to smallest
      @words = words.sort_by { it.length }.reverse
      @initial_grid = grid
      @final_grid = nil
    end

    def grid
      @final_grid
    end

    def calculate
      @final_grid = find_solution(@words.clone, @initial_grid.clone)
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
        grid # All the words has been placed
      else
        nil # All possibilities have been tried and there are still words left unplaced.
      end
    end

    def get_available_locations(word, grid)
      locations = []
      (0...grid.size).each do |row|
        (0...grid.size).each do |col|
          Grid.directions.keys.each do |direction|
            location = grid.find_sequence(word, row, col, direction)
            locations << location unless location.empty?
          end
        end
      end
      locations
    end
  end
end
