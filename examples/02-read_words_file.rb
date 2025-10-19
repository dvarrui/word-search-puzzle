#!/usr/bin/env ruby
# Create your puzzle reading words from external txt file

require_relative "../lib/word-search-puzzle"

# 1. Create puzzle (default size 10x10) reading words from text file
FILEPATH = File.join(File.dirname(__FILE__), "starwars.txt")
puzzle = WordSearchPuzzle.create(words: FILEPATH)

# 2. Check if exits solution
if puzzle.nil?
  puts "I'm sorry! Can't create the puzzle!"
  puts "Revise filepath, please! (#{filename})"
  exit 1
end

# 3. Show puzzle on screen
puts puzzle.render
