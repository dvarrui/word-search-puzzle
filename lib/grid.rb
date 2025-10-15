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
    @matriz.each { |row| puts row.map { " "+it.data.to_s }.join }
  end

  def find_sequence(word, first_row, first_col, direction)
    step = Grid.directions[direction]
    row = first_row
    col = first_col
    coords = []
    word.chars.each do |letter|
      return [] if (col >= @size || row >= @size || col < 0 || row < 0)

      cell = @matriz[row][col]
      if cell.empty? || cell.data == letter
        coords << Coord.new(row: row, col: col, data: letter)
        row += step[:row]
        col += step[:col]
      else 
        return []
      end
    end
    coords
  end

  def set_sequence(coords)
    coords.each { @matriz[it.row][it.col].push(it.data) }
  end

  def unset_sequence(coords)
    coords.each { @matriz[it.row][it.col].pop }
  end
end
