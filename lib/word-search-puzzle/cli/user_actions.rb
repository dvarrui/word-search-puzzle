require_relative '../../word-search-puzzle'

class UserActions
  def create(options)
    words = read_words(options['words'])
    size = options['size'] ? options['size'].to_i : 10
    color = options['color'] || false
    padding = options['padding'] ? options['padding'].split(',') : ('A'..'Z').to_a
    locks = read_locks(options['locks'])

    puzzle = WordSearchPuzzle.create(words: words, size: size, locks: locks)
    if puzzle
      puts puzzle.render(color: color, padding: padding)
    else
      error "Unable to create puzzle!"
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

  def read_locks(locks)
    if File.exist?(locks)
      data = File.readlines(locks)
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
    