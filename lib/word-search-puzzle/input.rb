module WordSearchPuzzle
  class Input
    DEFAULT_GRID_SIZE = 10

    def self.read_words(words)
      if words.is_a? Array
        if words.empty?
          warn "Input: empty parameter! (words)"
          exit 1
        end
        return words
      elsif File.exist?(words)
        lines = File.readlines(words)
        lines.map! { it.strip }
        lines.delete("")
        if lines.empty?
          warn "Input: empty file! (#{words})!"
          exit 1
        end
        return lines
      end

      if words.nil? || words.empty?
        warn "Input: empty parameter! (words)"
        exit 1
      end

      words.split(",").map { it.strip }
    end

    def self.read_size(size)
      (size ? size.to_i : DEFAULT_GRID_SIZE)
    end

    def self.read_gaps(gaps)
      return gaps if gaps.is_a? Array
      return [] if gaps.nil?

      if File.exist?(gaps)
        lines = File.readlines(gaps)
        lines.delete("")
        if gaps.end_with?(".csv")
          data = lines.map do
            items = it.split(",")
            [items[0].to_i, items[1].to_i]
          end
        else
          data = []
          lines.each_with_index do |line, row|
            line.chars.each_with_index do |char, col|
              data << [row, col] if char == "."
            end
          end
        end
        return data
      end

      []
    end

    def self.validations(words, size, gaps)
      msg = []
      words.each do |word|
        msg << "The word <#{word}> does not fit in the grid." if word.length > size
      end
      if words.size == 1 && msg.size == 1
        msg << "If <#{words.first}> is a filepath then it was not found."
      end
      total_words_size = words.sum { it.length }
      if total_words_size > (size * size - gaps.length)
        msg << "The grid is not large enough to contain all the words."
      end
      msg
    end
  end
end
