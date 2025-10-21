# frozen_string_literal: true

require "thor"
require_relative "version"
require_relative "../word-search-puzzle"
require_relative "cli/user_actions"

##
# Command Line User Interface
class CLI < Thor
  map ["h", "-h", "--help"] => "help"

  map ["v", "-v", "--version"] => "version"
  desc "version", "Show the program version"
  def version
    puts "#{WordSearchPuzzle::NAME} version #{WordSearchPuzzle::VERSION}"
    exit 0
  end

  map ["c", "-c", "--create"] => "create"
  option :words, required: true
  option :size
  option :color, type: :boolean
  option :padding
  option :gaps
  desc "create [--size=SIZE][--color]", "Create puzzle"
  long_desc <<-LONGDESC

  - [--words=LIST], comma-separated list of words or file name with the words

  - [--size=SIZE], Grid size. Default value 10x10.
  Examples 5:, sets rows=5 and cols=5.
  Example 10x20: sets rows=10 and col=20.

  - [--color], Indicates whether to display the output with color. Default value false

  - [--padding=LIST], comma.separated list of characters to fill puzzle. Default value A-Z.

  - [--gaps=FILEPATH], TEXT file with grid shape, or CSV file with gaps coordinates.
  
  LONGDESC
  def create
    WordSearchPuzzle::UserActions.new.create(options)
  end

  def respond_to_missing?(_method_name)
    true
  end

  ##
  # Thor stop and show messages on screen on failure
  def self.exit_on_failure?
    true
  end
end
