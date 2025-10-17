#!/usr/bin/env ruby

require_relative "../lib/word-search-puzzle"

# Initialize words list
words = %w[STARWARS OBIWAN LUKE VADER R2D2 C3PO LEIA YODA EMPERADOR SITH]

# Create puzzle (size 10x10)
puzzle = WordSearchPuzzle.create(words: words)

# Show puzzle on screen
puts puzzle.render
