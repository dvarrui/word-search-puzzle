require_relative "cell"
require "colorize"

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

  def show
    @matriz.each { |row| puts row.map { " "+it.data.to_s }.join }
  end

  def render(padding: true, color: false, alphabet: :default)
    alphabet = ('A'..'Z').to_a if alphabet == :default

    lines = @matriz.map do |row|
      row.map do |cell|
        data = cell.data.to_s
        data = alphabet.shuffle.first if padding && cell.count.zero?

        if color && cell.count.zero?
          data = data.colorize(:gray) 
        elsif color
          data = data.colorize(:ligth_white)
        end

        " " + data
      end.join
    end
    lines.join("\n")
  end
end