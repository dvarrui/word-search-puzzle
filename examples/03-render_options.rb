#!/usr/bin/env ruby
require_relative "../lib/word-search-puzzle"

# 1. Define your word list
words = %w[STARWARS OBIWAN LUKE VADER R2D2 C3PO LEIA YODA EMPERADOR SITH]

# 2. Create your puzzle (10x20 size)
puzzle = WordSearchPuzzle.create(
  words: words,
  size: "10x20"
)

# 3. Show puzzle on screen:
# - color: Use colors to highlight the words
# - padding: define the characters set used to fill the grid
puts puzzle.render(color: true, padding: ["."])
