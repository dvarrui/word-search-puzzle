# Word Search Puzzle

Ruby gem to create word search puzzles.

## Installation

Install the gem by executing:

    $ gem install word-search-puzzle

## Usage

> Using `word-search-puzzle` command line tool.

Create puzzle with default options:
```
$ word-search-puzzle create --words=JEDI,SITH,STARWARS
 L N M I J W U L H D
 X S A J I E N I V Y
 Z R P N R E B R N F
 H A Y N B W Q R X D
 Z W E G O R P F V A
 F R D X B Y T B I O
 O A A D X R G I O D
 I T U H T I S W U A
 T S Z N N H X Q O T
 X I D E J N J R M P
```

Create resolved puzzle: 
```
$ word-search-puzzle create --words=JEDI,SITH,STARWARS --size=8 --padding='.'
 . . . I . . . S
 . . . D . . . T
 . . . E . . . A
 . H . J . . . R
 . . T . . . . W
 . . . I . . . A
 . . . . S . . R
 . . . . . . . S
```

Create puzzle reading words from text file:
```
$ word-search-puzzle create --words=examples/starwars.txt                   
 Z P D O D C 3 P O O
 E M P E R A D O R O
 S R A W R A T S O B
 W O D H E O G C H I
 R E V A D E R M H W
 M B S I S F X Y U A
 J L I E I R R O G N
 K Z G L S Q N D B R
 W L Y S I T H A R V
 C Z 2 D 2 R L U K E
 ```

## Documentation

* [Command line options](docs/options.md)
* [Examples of using the Ruby library](examples/)
* [Developement](docs/development.md)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dvarrui/word-search-puzzle.

