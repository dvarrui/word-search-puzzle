#!/usr/bin/env ruby
require "debug"
require_relative "lib/grid"
require_relative "lib/word-search-puzzle"

words = %w[negro azul gris verde naranja rosa rojo blanco amarillo]

wsp = WordSearchPuzzle::WordSearchPuzzle.new(words: words, size: 9)
wsp.create_puzzle
wsp.puzzle.show