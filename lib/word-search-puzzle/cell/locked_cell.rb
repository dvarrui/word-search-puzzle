class Cell
  attr_reader :data, :count

  def initialize
    @count = 0
    @data = '?'
    @state = :empty
  end

  def empty?
    @state == :empty
  end

  def in_use?
    @state == :in_use
  end

  def push(data)
    if empty? || @data == data
      @data = data
      @count += 1
      @state = :in_use
    else
      raise "Cell.push: new data(#{data}) is not equal to current data(#{@data})!"
    end
  end

  def pop
    raise "Cell.pop: No data!" unless in_use?

    @count -= 1
    current_data = @data
    if @count.zero?
      @data = '?'
      @state = :empty
    end
    current_data
  end
end
