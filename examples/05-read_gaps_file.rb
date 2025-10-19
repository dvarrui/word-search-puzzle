#!/usr/bin/env ruby
require_relative "../lib/word-search-puzzle"

# 1. Read a CSV file with your gaps definition.
#    Gaps positions within the grid that cannot be used for the puzzle.
FILEPATH = File.join(File.dirname(__FILE__), "ball-gaps.csv")

# 2. Define words list
words = %w[DEATH STAR RETURN JEDI]

# 3. Create puzzle with custom words, default size (10x10), and custom gaps
puzzle = WordSearchPuzzle.create(
  words: words,
  gaps: FILEPATH
)

# 4. Render puzzle on screen
puts puzzle.render(color: true, padding: ["@"])
