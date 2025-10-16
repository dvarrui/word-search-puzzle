require_relative '../../word-search-puzzle'

class UserActions
  def create(options)
    words = read_words(options['words'])
    size = options['size'] ? options['size'].to_i : 10
    color = options['color'] || false
    padding = options['padding'] ? options['padding'].split(',') : ('A'..'Z').to_a
    puzzle = WordSearchPuzzle.create(words: words, size: size)
    if puzzle
      puts puzzle.render(color: color, padding: padding)
    else
      error "Unable to create puzzle!"
    end
  end

  def read_words(words)
    if File.exist?(words)
      data = File.readlines(words) 
      return data.map { it.strip }
    end
    words.split(',')
  end
end
    