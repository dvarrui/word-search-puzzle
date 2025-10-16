#!/usr/bin/env ruby
require_relative "../lib/word-search-puzzle"

words = %w[STARWARS OBIWAN LUKE VADER R2D2 C3PO LEIA YODA EMPERADOR SITH]

puzzle = WordSearchPuzzle.create(
  words: words, 
  size: 10)

puts puzzle.render(color: true, padding: ['.'])
