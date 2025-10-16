#!/usr/bin/env ruby
require "debug"
require_relative "lib/word-search-puzzle"

# words = %w[RED BLUE YELLOW GREEN BLACK WHITE PINK PURPLE ORANGE BROWN GREY]
words = %w[RED BLUE YELLOW GREEN BLACK WHITE PINK PURPLE ORANGE BROWN GREY]

puzzle = WordSearchPuzzle.create(words: words, size: 10)
puts puzzle.render
