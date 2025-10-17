module WordSearchPuzzle
  class Cell
    attr_reader :data, :count
  
    def initialize
      @count = 0
      @data = :empty
    end
  
    def empty?
      @data == :empty
    end
  
    def gap?
      @data == :gap
    end
  
    def gap!
      @data = :gap
    end
  
    def in_use?
      @count > 0
    end
  
    def push(data)
      if empty? || @data == data
        @data = data
        @count += 1
      else
        raise "Cell.push: new data(#{data}) is not equal to current data(#{@data})!"
      end
    end
  
    def pop
      raise "Cell.pop: No data!" unless in_use?
  
      @count -= 1
      current_data = @data
      @data = :empty if @count.zero?
      current_data
    end
  end
end

