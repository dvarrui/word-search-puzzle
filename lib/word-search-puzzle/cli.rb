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
  option :size
  option :words
  option :color, type: :boolean
  option :padding
  desc "create [--words=WORDS][--size=SIZE][--color]", "Create puzzle"
  long_desc <<-LONGDESC

  - [--words=LIST], comma-separated list of words or file name with the words

  - [--size=SIZE], Grid size. Default value 10.

  - [--color], Indicates whether to display the output with color. Default value false

  - [--padding=LIST], comma.separated list of characters to fill in the gaps in the puzzle. Default value A-Z.

  LONGDESC
  def create
    UserActions.create(options)
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
