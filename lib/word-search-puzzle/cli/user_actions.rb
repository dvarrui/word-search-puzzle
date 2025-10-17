require_relative '../../word-search-puzzle'

module WordSearchPuzzle
  class UserActions
    def create(options)
      puzzle = WordSearchPuzzle.create(
        words: options['words'], 
        size: options['size'] ? options['size'].to_i : 10, 
        gaps: options['gaps'])

      if puzzle.nil?
        STDERR.puts "WARN: Unable to create puzzle!"
        exit 1
      end

      color = options['color'] || false
      padding = options['padding'] ? options['padding'].split(',') : ('A'..'Z').to_a
      puts puzzle.render(color: color, padding: padding)
    end
  end
end


    