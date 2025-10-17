#!/usr/bin/env ruby

require_relative "../lib/word-search-puzzle"
require "debug"

# Create puzzle (size 10x10)
filename = 'starwars.txt'
puzzle = WordSearchPuzzle.create(words: filename)

# Check solution
if puzzle.nil?
  puts "ERROR: File not found! (#{filename})"
  exit 1
end

# Show puzzle on screen
puts puzzle.render
