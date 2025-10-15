#!/usr/bin/env ruby
require "debug"
require_relative "lib/grid"
require_relative "lib/word_search_puzzle"

words = %w[negro azul gris verde naranja rosa rojo blanco amarillo]

wsp = WordSearchPuzzle.new(words: words, size: 9)
wsp.resolv
wsp.puzzle.show