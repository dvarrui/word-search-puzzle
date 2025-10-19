#!/usr/bin/env ruby
# Create puzzle with default options

require_relative "../lib/word-search-puzzle"

# 1. Initialize your words list
words = %w[STARWARS OBIWAN LUKE VADER R2D2 C3PO LEIA YODA EMPERADOR SITH]

# 2. Create puzzle (Default size 10x10)
puzzle = WordSearchPuzzle.create(words: words)

# 3. Show puzzle on screen
puts puzzle.render
