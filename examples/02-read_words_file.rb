#!/usr/bin/env ruby

require_relative "../lib/word-search-puzzle"

# Create puzzle (size 10x10)
puzzle = WordSearchPuzzle.create(words: 'starwars.txt')

# Show puzzle on screen
puts puzzle.render
