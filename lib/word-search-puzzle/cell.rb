class Cell
  EMPTY = ""

  attr_reader :data, :count

  def initialize
    @count = 0
    @data = EMPTY
  end

  def empty?
    @data == EMPTY
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
    raise "Cell.pop: No data!" if @count.zero?
    @count -= 1
    current_data = @data
    @data = EMPTY if @count.zero?
    current_data
  end
end
