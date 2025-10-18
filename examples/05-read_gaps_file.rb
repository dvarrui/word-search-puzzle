#!/usr/bin/env ruby
require_relative "../lib/word-search-puzzle"

# gaps:
# - Define gaps within the grid
# - Gaps are positions within the grid that cannot be used for the puzzle.
filepath = "ball-gaps.csv"

# Define words list
words = %w[DEATH STAR RETURN JEDI]

# Create puzzle (10x10)
puzzle = WordSearchPuzzle.create(
  words: words,
  gaps: filepath
)

# Render puzzle on screen
puts puzzle.render(color: true, padding: ["@"])
