class Cell
  EMPTY = "_"

  attr_reader :data

  def initialize
    @amount = 0
    @data = EMPTY
  end

  def empty?
    @data == EMPTY
  end

  def push(data)
    if empty? || @data == data
      @data = data
      @amount += 1
    else
      raise "Cell.push(#{data}): current data (#{@data}) different from new one!"
    end
  end

  def pull
    raise "Cell.pull: No data!" if @amount.zero?
    @amount -= 1
    current_data = @data
    @data = EMPTY if @amount.zero?
    current_data
  end

  def to_s
    @data.to_s
  end
end
