require_relative '../../word-search-puzzle'

module UserActions
  def self.create(options)
    words = options['words'].split(',')
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
end
    