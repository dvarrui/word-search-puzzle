#!/usr/bin/env ruby
require "debug"
require_relative "lib/grid"
require_relative "lib/word_search_puzzle"

words = %w[negro azul gris verde naranja rosa rojo blanco amarillo]

grid = Grid.new(10)

location1 = grid.get_sequence("negro", 1, 2, :e)
grid.set_coords(location1)

location2 = grid.get_secuence("gato", 4, 7, :w)
grid.set_coords(location2)

location3 = grid.get_sequence("gris", 4, 7, :s)
grid.set_coords(location3)
grid.show

location4 = grid.get_sequence("abc", 1, 1, :e)
grid.set_coords(location4)
grid.show

grid.unset_sequence(location1)
grid.show

words = %w[negro gris amarillo]
WordSearchPuzzle.new(words: words, size: 10)
