require_relative '../../word-search-puzzle'

module WordSearchPuzzle
  class UserActions
    def create(options)
      size = options['size'] ? options['size'].to_i : 10
  
      puzzle = WordSearchPuzzle.create(
        words: option['words'], 
        size: size, 
        gaps: options['gaps'])

        if puzzle.nil?
        STDERR.puts "Unable to create puzzle!"
        exit 1
      end

      color = options['color'] || false
      padding = options['padding'] ? options['padding'].split(',') : ('A'..'Z').to_a
      puts puzzle.render(color: color, padding: padding)
    end
  end
end


    