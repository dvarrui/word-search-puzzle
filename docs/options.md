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

## Padding

## Gaps

Using `gaps` to customize grid shape.

```
$ word-search-puzzle create --words=DEATH,STAR --padding='.' --gaps=examples/ball-gaps.txt
                    
       S . . .      
     . . T . . .    
   . . . . A . . .  
   . . . . . R . D  
   . . . . . . E .  
   . . . . . A . .  
     . . . T . .    
       . H . . 

```

```
$ word-search-puzzle create --words=DEATH,STAR --gaps=examples/ball-gaps.txt 
                    
       N L P T      
     O R P S P O    
   V E A S T D P Q  
   Y O B B A H C X  
   O P B M R T W K  
   V O I P K A F T  
     H H J N E X    
       U J D D   
```