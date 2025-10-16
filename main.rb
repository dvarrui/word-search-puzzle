#!/usr/bin/env ruby
require "debug"
require_relative "lib/word-search-puzzle"

# words = %w[RED BLUE YELLOW GREEN BLACK WHITE PINK PURPLE ORANGE BROWN GREY]
words = %w[RED BLUE YELLOW GREEN BLACK WHITE PINK PURPLE ORANGE BROWN GREY]

puzzle = WordSearchPuzzle.create(
  words: words, 
  size: 10, 
  locks: [[0,0], [0,1], [0,2], [1,0], [2,0], [1,1]]
  )
puts puzzle.render
