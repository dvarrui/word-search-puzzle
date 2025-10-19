#!/usr/bin/env ruby

require_relative "../lib/word-search-puzzle"

# Create puzzle (size 10x10) reading words list from text file
filename = File.join(__dir___, "starwars.txt")
puzzle = WordSearchPuzzle.create(words: filename)

# Check if exits solution
if puzzle.nil?
  puts "I can't create the puzzle!"
  puts "Revise fiilepath! (#{filename})"
  exit 1
end

# Show puzzle on screen
puts puzzle.render
