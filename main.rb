#!/usr/bin/env ruby
require "debug"
require_relative "lib/grid"
require_relative "lib/word_search_puzzle"

words = %w[negro azul gris verde naranja rosa rojo blanco amarillo]

grid = Grid.new(10)

location = grid.get_coords("negro", 1, 2, :e)
grid.set_coords(location)

location = grid.get_coords("gato", 4, 7, :w)
grid.set_coords(location)

location = grid.get_coords("gris", 4, 7, :s)
grid.set_coords(location)
grid.show

location = grid.get_coords("abc", 1, 1, :e)
grid.set_coords(location)
grid.show

words = %w[negro gris amarillo]
WordSearchPuzzle.new(words: words, grid_size: 10)
