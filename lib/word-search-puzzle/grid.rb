require_relative "cell"
require "colorize"

module WordSearchPuzzle
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
    attr_reader :size

    def initialize(size, gaps = [])
      @size = size
      @matrix = []
      (0...size).each do |row|
        data = []
        (0...size).each { |col| data << Cell.new }
        @matrix[row] = data
      end
      gaps.each { |x, y| @matrix[x][y].gap! }
    end

    def cell(row, col)
      @matrix[row][col]
    end

    def find_sequence(word, first_row, first_col, direction)
      step = Grid.directions[direction]
      row = first_row
      col = first_col
      coords = []
      word.chars.each do |letter|
        return [] if row >= @size || col >= @size || row < 0 || col < 0

        cell = @matrix[row][col]
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
      coords.each { @matrix[it.row][it.col].push(it.data) }
    end

    def unset_sequence(coords)
      coords.each { @matrix[it.row][it.col].pop }
    end

    def render(color: false, padding: :default)
      padding ||= ["."]
      padding = ("A".."Z").to_a if padding == :default

      lines = @matrix.map do |row|
        row.map { render_cell(it, color, padding) }.join
      end
      lines.join("\n")
    end

    private

    def render_cell(cell, color, padding)
      return "  " if cell.gap?
      data = cell.data.to_s
      data = padding.sample if cell.count.zero?

      if color && cell.count.zero?
        data = data.colorize(:gray)
      elsif color
        data = data.colorize(:ligth_white)
      end

      " " + data
    end
  end
end
