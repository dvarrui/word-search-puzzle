require_relative 'cell'

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
      nw: {row: -1, col: -1},
    }
  end

  def initialize(size)
    @size = size
    @matriz = []
    (0..size).each do |row|
      data = []
      (0..size).each { |col| data <<  Cell.new }
      @matriz[row] = data
    end 
  end

  def show
    puts "Show grid:"
    @matriz.each { |row| puts row.map { _1.to_s }.join }
  end

  def add(word, row, col, move)
    row_step = Grid.directions[move][:row]
    col_step = Grid.directions[move][:col]
    letters = word.chars
    arow = row
    acol = col
    letters.each do |letter|
      return false if acol >= @size || arow >= @size

      cell = @matriz[arow][acol]
      if cell.empty? || cell.data == letter
        cell.push letter
        arow += row_step
        acol += col_step
      end
    end
    true
  end
end