#!/usr/bin/env ruby
require "debug"
require_relative "lib/word-search-puzzle"

words = %w[negro azul gris verde naranja rosa rojo blanco amarillo]

builder = WordSearchPuzzle::Builder.new
builder.words = words
builder.size = 9
builder.create_puzzle
builder.puzzle.show