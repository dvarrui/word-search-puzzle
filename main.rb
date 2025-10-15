#!/usr/bin/env ruby
require "debug"
require_relative "lib/grid"
require_relative "lib/word_search_puzzle"

words = %w[negro azul gris verde naranja rosa rojo blanco amarillo]

grid = Grid.new(10)

sequences = []
sequences << grid.find_sequence("negro", 1, 2, :e)
grid.set_sequence(sequences[0])

sequences << grid.find_sequence("gato", 4, 7, :w)
grid.set_sequence(sequences[1])

sequences << grid.find_sequence("gris", 4, 7, :s)
grid.set_sequence(sequences[2])
grid.show

sequences << grid.find_sequence("abc", 1, 1, :e)
grid.set_sequence(sequences[3])
grid.show

grid.unset_sequence(sequences[0])
grid.show

sequences[3] = grid.find_sequence("abc", 1, 1, :e)
grid.set_sequence(sequences[3])
grid.show

grid.unset_sequence(sequences[1])
grid.show
words = %w[negro gris amarillo]
WordSearchPuzzle.new(words: words, size: 10)
