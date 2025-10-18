#!/usr/bin/env ruby
require_relative "../lib/word-search-puzzle"

words = %w[STARWARS OBIWAN LUKE VADER R2D2 C3PO LEIA YODA EMPERADOR SITH]

puzzle = WordSearchPuzzle.create(
  words: words,
  size: 10
)

# Show puzzle on screen:
# - color: Using colors to highlight words
# - padding: define the characters used to fill
puts puzzle.render(color: true, padding: ["."])
