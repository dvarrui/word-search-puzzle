# Word Search Puzzle

Ruby gem to create word search puzzles.

## Installation

Install the gem by executing:

    $ gem install word-search-puzzle

## Usage

Run the p`word-search-puzzle` command from the command line.

**Example**: create puzzle with default options.

```
$ word-search-puzzle create --words=JEDI,SITH,STARWARS
```
![](docs/images/puzzle-01.png)

> Each execution builds a different puzzle.

**Example**: Create a puzzle showing the final solution. 
```
$ word-search-puzzle create --words=VADER,OBIWAN,LUKE --padding='.'
 . . . V . . . . . .
 . . . . A . . . . .
 . . . . . D . . . .
 . . . . . . E . . .
 . . . . . . . R . .
 . . . . . . . . . .
 . . . . O B I W A N
 . . . . . . . . . .
 . . E K U L . . . .
 . . . . . . . . . .
```

**Example**: Create puzzle reading words from text file.
```
$ word-search-puzzle create --words=examples/starwars.txt                   
```
![](docs/images/puzzle-03.png)

> **WARNING:**
> Depending on the number and size of the words, the size of the grid, and the numbers of gaps, sometimes it will not be possible to find a solution.

## Documentation

* [Command line options and examples](docs/options.md)
* [Examples using the Ruby library](examples/)
* [Developement](docs/development.md)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dvarrui/word-search-puzzle.

