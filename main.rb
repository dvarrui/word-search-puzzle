#!/usr/bin/env ruby
require 'debug'
require_relative 'lib/grid'
require_relative 'lib/word_search_puzzle'

words = %w[negro azul gris verde naranja rosa rojo blanco amarillo]
puts words.to_s

grid = Grid.new(10)
grid.add('negro', 1, 2, :e)
grid.add('gato', 4, 7, :w)
grid.add('gris', 4, 7, :s)

grid.show

words = %w[negro gris amarillo]
word_search_puzzle = WordSearchPuzzle.new(words: words, grid_size:10)