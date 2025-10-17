require_relative '../../word-search-puzzle'

module WordSearchPuzzle
  class UserActions
    def create(options)
      words = read_words(options['words'])
      size = options['size'] ? options['size'].to_i : 10
      color = options['color'] || false
      padding = options['padding'] ? options['padding'].split(',') : ('A'..'Z').to_a
      gaps = read_gaps(options['gaps'])
  
      puzzle = WordSearchPuzzle.create(words: words, size: size, gaps: gaps)
      if puzzle
        puts puzzle.render(color: color, padding: padding)
      else
        STDERR.puts "Unable to create puzzle!"
      end
    end
  
    def read_words(words)
      if File.exist?(words)
        data = File.readlines(words)
        data.map! { it.strip }
        data.delete("") 
        return data
      end
      words.split(',')
    end
  
    def read_gaps(gaps)
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
end


    