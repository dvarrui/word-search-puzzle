require_relative "cell"

class Grid
  def self.directions
    {
      n: {row: -1, col: 0},
      ne: {row: -1, col: 1},
      e: {row: 0, col: 1},
      se: {row: 1, col: 1},
      s: {row: 1, col: 0},
      sw: {row: 1, col: -1},
      w: {row: 0, col: -1},
      nw: {row: -1, col: -1}
    }
  end

  Coord = Data.define(:row, :col, :data)

  def initialize(size)
    @size = size
    @matriz = []
    (0..size).each do |row|
      data = []
      (0..size).each { |col| data << Cell.new }
      @matriz[row] = data
    end
  end

  def show
    puts "Show grid:"
    @matriz.each { |row| puts row.map { it.to_s }.join }
  end

  def get_coords(word, row, col, direction)
    step = Grid.directions[direction]
    arow = row
    acol = col
    coords = []
    word.chars.each do |letter|
      return [] if (acol >= @size || arow >= @size || acol < 0 || arow < 0)

      cell = @matriz[arow][acol]
      if cell.empty? || cell.data == letter
        coords << Coord.new(row: arow, col: acol, data: letter)
        arow += step[:row]
        acol += step[:col]
      else 
        return []
      end
    end
    coords
  end

  def set_coords(coords)
    coords.each do |coord|
      @matriz[coord.row][coord.col].push(coord.data)
    end
  end
end
