module WordSearchPuzzle
  class Input
    def self.read_words(words)
      if words.is_a? Array
        if words.empty?
          STDERR.puts "Input: param empty! (words)" 
          exit 1
        end
        return words
      elsif File.exist?(words)
        lines = File.readlines(words)
        lines.map! { it.strip }
        lines.delete("") 
        if lines.empty?
          STDERR.puts "Input: filename empty! (#{words})!" 
          exit 1
        end
        return lines
      end

      if words.nil? || words.empty?
        STDERR.puts "Input: param empty! (words)" 
        exit 1
      end

      words.split(',')
    end

    def self.read_gaps(gaps)
      return gaps if gaps.is_a? Array
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

    def self.read_size(size)
      return (size ? size.to_i : 10)
    end
  end
end