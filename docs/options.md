[<< back](../README.md)

# Command line options

## Help

* Show help: `word-search-puzzle help`
* Show **create** action help: `word-search-puzzle help create`

## Options

**Building options**: to create different puzzles.

* `--words`, Comma separated list of word or file name with de words.
* `--size`, Grid size. Default value 10.

**Rendering options**: To display the puzzle in different ways.

* `--color`, Indicates whether to display the output with color. Default value false.
* `--padding=LIST`, comma.separated list of characters to fill in the gaps in the puzzle. Default value A-Z.
* `--gaps=FILEPATH`, Filename with list of gaps coordinates. List of `row,col` integers.

## Color

The `color` option, highlights the list of words within the puzzle, so we can easily identify their location.

```
$ word-search-puzzle create --words=DEATH,STAR --color
```
![](images/puzzle-04.png)

## Padding

In the puzzle creation process, we first place the word list inside the grid and then fill in the blanks with random letters until the grid is completely filled.

During this step, the letters A through Z will be used by default as random values.

However, in some cases, the words in our puzzle may use other characters set (for example, Japanese characters), so we use `padding` option set custom random character fill list

**Example**: Using `padding` option to custom random padding values.

```
$ word-search-puzzle create --words=DEATH,STAR --padding='+,*,x' 
 * x * + x x * * x x
 * x x + x * * * * x
 + x * * + x * * + +
 + + x x + x + * x +
 * * * + * + + + + x
 + * x + * + H x * x
 + * + + x T + + x *
 + x + x A * + + + +
 x x x E * + R A T S
 x x D * x + * * x x
```

## Gaps

The grid is a group of cell into square or a rectangle shape. However, this program offers us to customize the grid shape.

To do this, first we start with a square grid and gradually remove the cells defined by `gaps` option to customize the shape.

**Example**: Using `gaps` to customize grid shape.

```
$ word-search-puzzle create --words=DEATH,STAR --gaps=examples/ball-gaps.csv
                    
       N L P T      
     O R P S P O    
   V E A S T D P Q  
   Y O B B A H C X  
   O P B M R T W K  
   V O I P K A F T  
     H H J N E X    
       U J D D   
```