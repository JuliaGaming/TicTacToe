# TicTacToe
Made by [Soumitra Shewale (soumitradev)](https://github.com/soumitradev)

## Dependencies
- Julia (tested in 1.3.1 on Windows 10 Version 1809)

## Running the game
`C:\**************\GCI\TicTacToe>julia TicTacToe.jl`

## Features
- Singleplayer and Multiplayer (2 Players) mode
- User input is scrubbed everywhere
- Multiple difficulty settings for Singleplayer
    - `loser`: AI always makes worst move.
    - `easy`: AI plays randomly.
    - `medium`: AI plays smart, but still makes mistakes.
    - `hard`: AI plays smarter, makes less mistakes.
    - `impossible`: AI always makes best move. Impossible to win this.
- Code is extensively commented
- Play again prompt at end of game
- Uses Minimax algorithm for AI
- Type `exit` at any input prompt to exit game.

## Tutorial
- Type `exit` at any input prompt to exit game.
- To perform a move, type in the row index and column index of the cell you want to perform a move in.
- Enjoy!

## Gameplay

### Singleplayer Mode

#### `loser` difficulty
```
C:\**************\GCI\TicTacToe>julia TicTacToe.jl
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
1
You will be playing as X. The computer is O.
Type `exit` to exit the game whenever you want.

Select difficulty:
- `loser`: AI always makes worst move
- `easy`: AI plays randomly
- `medium`: AI plays smart, but still makes mistakes.
- `hard`: AI plays smarter, makes less mistakes.
- `impossible`: AI always makes best move. Impossible to win this.
loser
  1   2   3
1   |   |
 ———┼———┼———
2   |   |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 1 1
  1   2   3
1 X | O |
 ———┼———┼———
2   |   |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 2 2
  1   2   3
1 X | O |
 ———┼———┼———
2   | X |
 ———┼———┼———
3   | O |
Enter row and column seperated by space: 3 3
  1   2   3
1 X | O |
 ———┼———┼———
2   | X |
 ———┼———┼———
3   | O | X
Human wins. There is hope! The humans are still worthy!
Play again? (y/n): n

C:\**************\GCI\TicTacToe>
```

#### `easy` difficulty
```
C:\**************\GCI\TicTacToe>julia TicTacToe.jl
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
1
You will be playing as X. The computer is O.
Type `exit` to exit the game whenever you want.

Select difficulty:
- `loser`: AI always makes worst move
- `easy`: AI plays randomly
- `medium`: AI plays smart, but still makes mistakes.
- `hard`: AI plays smarter, makes less mistakes.
- `impossible`: AI always makes best move. Impossible to win this.
easy
  1   2   3
1   |   |
 ———┼———┼———
2   |   |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 1 1
  1   2   3
1 X |   |
 ———┼———┼———
2   |   |
 ———┼———┼———
3 O |   |
Enter row and column seperated by space: 2 2
  1   2   3
1 X |   |
 ———┼———┼———
2 O | X |
 ———┼———┼———
3 O |   |
Enter row and column seperated by space: 3 3
  1   2   3
1 X |   |
 ———┼———┼———
2 O | X |
 ———┼———┼———
3 O |   | X
Human wins. There is hope! The humans are still worthy!
Play again? (y/n): n

C:\**************\GCI\TicTacToe>
```

#### `medium` difficulty
```
C:\**************\GCI\TicTacToe>julia TicTacToe.jl
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
1
You will be playing as X. The computer is O.
Type `exit` to exit the game whenever you want.

Select difficulty:
- `loser`: AI always makes worst move
- `easy`: AI plays randomly
- `medium`: AI plays smart, but still makes mistakes.
- `hard`: AI plays smarter, makes less mistakes.
- `impossible`: AI always makes best move. Impossible to win this.
medium
  1   2   3
1   |   |
 ———┼———┼———
2   |   |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 1 1
  1   2   3
1 X |   |
 ———┼———┼———
2   | O |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 1 2
  1   2   3
1 X | X | O
 ———┼———┼———
2   | O |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 3 1
  1   2   3
1 X | X | O
 ———┼———┼———
2   | O |
 ———┼———┼———
3 X | O |
Enter row and column seperated by space: 2 1
  1   2   3
1 X | X | O
 ———┼———┼———
2 X | O |
 ———┼———┼———
3 X | O |
Human wins. There is hope! The humans are still worthy!
Play again? (y/n): n

C:\**************\GCI\TicTacToe>
```

#### `hard` difficulty
```
C:\**************\GCI\TicTacToe>julia TicTacToe.jl
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
1
You will be playing as X. The computer is O.
Type `exit` to exit the game whenever you want.

Select difficulty:
- `loser`: AI always makes worst move
- `easy`: AI plays randomly
- `medium`: AI plays smart, but still makes mistakes.
- `hard`: AI plays smarter, makes less mistakes.
- `impossible`: AI always makes best move. Impossible to win this.
hard
  1   2   3
1   |   |
 ———┼———┼———
2   |   |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 1 1
  1   2   3
1 X |   |
 ———┼———┼———
2   | O |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 3 1
  1   2   3
1 X |   |
 ———┼———┼———
2 O | O |
 ———┼———┼———
3 X |   |
Enter row and column seperated by space: 2 3
  1   2   3
1 X |   | O
 ———┼———┼———
2 O | O | X
 ———┼———┼———
3 X |   |
Enter row and column seperated by space: 1 2
  1   2   3
1 X | X | O
 ———┼———┼———
2 O | O | X
 ———┼———┼———
3 X | O |
Enter row and column seperated by space: 3 3
  1   2   3
1 X | X | O
 ———┼———┼———
2 O | O | X
 ———┼———┼———
3 X | O | X
Tie. Have we reached the singularity?
Play again? (y/n): n

C:\**************\GCI\TicTacToe>
```

#### `impossible` difficulty
```
C:\**************\GCI\TicTacToe>julia TicTacToe.jl
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
1
You will be playing as X. The computer is O.
Type `exit` to exit the game whenever you want.

Select difficulty:
- `loser`: AI always makes worst move
- `easy`: AI plays randomly
- `medium`: AI plays smart, but still makes mistakes.
- `hard`: AI plays smarter, makes less mistakes.
- `impossible`: AI always makes best move. Impossible to win this.
impossible
  1   2   3
1   |   |
 ———┼———┼———
2   |   |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 1 1
  1   2   3
1 X |   |
 ———┼———┼———
2   | O |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 1 2
  1   2   3
1 X | X | O
 ———┼———┼———
2   | O |
 ———┼———┼———
3   |   |
Enter row and column seperated by space: 3 1
  1   2   3
1 X | X | O
 ———┼———┼———
2 O | O |
 ———┼———┼———
3 X |   |
Enter row and column seperated by space: 2 3
  1   2   3
1 X | X | O
 ———┼———┼———
2 O | O | X
 ———┼———┼———
3 X | O |
Enter row and column seperated by space: 3 3
  1   2   3
1 X | X | O
 ———┼———┼———
2 O | O | X
 ———┼———┼———
3 X | O | X
Tie. Have we reached the singularity?
Play again? (y/n): n

C:\**************\GCI\TicTacToe>
```

### Multiplayer Mode
```
C:\**************\GCI\TicTacToe>julia TicTacToe.jl
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
2
Player 1 (X) goes first. Player 2 (O) goes after Player 1.
Type `exit` to exit the game whenever you want.
  1   2   3
1   |   |
 ———┼———┼———
2   |   |
 ———┼———┼———
3   |   |
Player 1, enter row and column seperated by space: 1 1
  1   2   3
1 X |   |
 ———┼———┼———
2   |   |
 ———┼———┼———
3   |   |
Player 2, enter row and column seperated by space: 2 1
  1   2   3
1 X |   |
 ———┼———┼———
2 O |   |
 ———┼———┼———
3   |   |
Player 1, enter row and column seperated by space: 1 2
  1   2   3
1 X | X |
 ———┼———┼———
2 O |   |
 ———┼———┼———
3   |   |
Player 2, enter row and column seperated by space: 2 2
  1   2   3
1 X | X |
 ———┼———┼———
2 O | O |
 ———┼———┼———
3   |   |
Player 1, enter row and column seperated by space: 1 3
  1   2   3
1 X | X | X
 ———┼———┼———
2 O | O |
 ———┼———┼———
3   |   |
Player 1 Wins!
Play again? (y/n): n

C:\**************\GCI\TicTacToe>
```

### Misc. Features

You can exit the game anywhere (implemented everywhere, but this example only shows at mode select screen):
```
C:\**************\GCI\TicTacToe>julia TicTacToe.jl
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
exit

C:\**************\GCI\TicTacToe>
```

User input is scrubbed everywhere (scrubbed everywhere, but this example only shows at mode select screen):
```
C:\**************\GCI\TicTacToe>julia TicTacToe.jl
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
haha
Please enter a valid command (see README)
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
yes
Please enter a valid command (see README)
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
exit

C:\**************\GCI\TicTacToe>
```

Game can be replayed at the end of game (Game continues, but example shows exiting new game):
```
C:\**************\GCI\TicTacToe>julia TicTacToe.jl
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
2
Player 1 (X) goes first. Player 2 (O) goes after Player 1.
Type `exit` to exit the game whenever you want.
  1   2   3
1   |   |
 ———┼———┼———
2   |   |
 ———┼———┼———
3   |   |
Player 1, enter row and column seperated by space: 1 1
  1   2   3
1 X |   |
 ———┼———┼———
2   |   |
 ———┼———┼———
3   |   |
Player 2, enter row and column seperated by space: 2 1
  1   2   3
1 X |   |
 ———┼———┼———
2 O |   |
 ———┼———┼———
3   |   |
Player 1, enter row and column seperated by space: 1 2
  1   2   3
1 X | X |
 ———┼———┼———
2 O |   |
 ———┼———┼———
3   |   |
Player 2, enter row and column seperated by space: 2 2
  1   2   3
1 X | X |
 ———┼———┼———
2 O | O |
 ———┼———┼———
3   |   |
Player 1, enter row and column seperated by space: 1 3
  1   2   3
1 X | X | X
 ———┼———┼———
2 O | O |
 ———┼———┼———
3   |   |
Player 1 Wins!
Play again? (y/n): y
Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?
exit

C:\**************\GCI\TicTacToe>
```

## References
Understanding of Minimax thanks to: https://www.youtube.com/watch?v=l-hh51ncgDI
