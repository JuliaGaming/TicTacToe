#= TicTacToe implementation in Julia
@author : soumitradev (Soumitra Shewale)
=#

# Create 3x3 board for TicTacToe
board = [[" ", " ", " "],
         [" ", " ", " "],
         [" ", " ", " "]];

# Define Player Characters for singleplayer
# Spelled wrong for (bad) comedic purposes (I know, very funny haha)
human = "X"
ai = "O"

# Define win codes used in checking who won, and in minimax algorithm as a score
# -1 indicates undesirable outcome in minimax, while +1 indicates desirable, and 0 is neutral
human_win = -1
ai_win = 1
tie = 0

# Define Player Characters for multiplayer
player1 = "X"
player2 = "O"

# Define win codes used in checking who won
# These codes are not used in minimax, but are only used to denote the player
player1_win = -1
player2_win = 1
tie = 0

# Get array of tuples of all available (unoccupied) indices in board to allow AI to choose from these options
function get_available(board)
    available_pos = []
    # Go through all elements in array and check if they are unoccupied
    for i in 1:3, j in 1:3
        # Check if element is unoccupied
        if board[i][j] == " "
            # If the element is unoccupied, append the tuple of the indices to the available array.
            push!(available_pos, (i, j))
        end
    end
    return available_pos
end

# Check number of available (unoccupied) cells similar to how we did above.
function check_available(board)
    available = 0
    for i in 1:3, j in 1:3
        if board[i][j] == " "
            available += 1
        end
    end
    return available
end

# Check if the board is in a terminal (win or tie) situation.
function check_win(board)
    # Define p1 & p2 and their properties to avoid mixing up with player1, player2, human, and ai variables.
    p1 = "X"
    p2 = "O"

    p1_win = -1
    p2_win = +1
    tie = 0

    # Horizontal line checker
    for i in 1:3
        # For every row, check if the elements in a row are same, and belong to some player (instead of being unoccupied)
        if ((board[i][1] == board[i][2] == board[i][3]) && (board[i][1] in [p1, p2]))
            # If row belongs to p1, return signal showing p1 wins.
            if (board[i][1] == board[i][2] == board[i][3] == p1)
                return p1_win 
            # If row belongs to p2, return signal showing p2 wins.
            elseif (board[i][1] == board[i][2] == board[i][3] == p2)
                return p2_win
            end                
        end
    end

    # Vertical line checker
    for i in 1:3
        # For every column, check if the elements in a column are same, and belong to some player (instead of being unoccupied)
        if ((board[1][i] == board[2][i] == board[3][i]) && (board[1][i] in [p1, p2]))
            # If column belongs to p1, return signal showing p1 wins.
            if (board[1][i] == board[2][i] == board[3][i] == p1)
                return p1_win 
            # If column belongs to p2, return signal showing p2 wins.
            elseif (board[1][i] == board[2][i] == board[3][i] == p2)
                return p2_win
            end                
        end
    end
    
    # Diagonal (from (1, 1) to (3, 3)) line checker
    if (board[1][1] == board[2][2] == board[3][3])
        # Check if diagonal belongs to p1 and if true, return signal showing p1 wins
        if (board[1][1] == board[2][2] == board[3][3] == p1)
            return p1_win 
        # Check if diagonal belongs to p2 and if true, return signal showing p2 wins
        elseif (board[1][1] == board[2][2] == board[3][3] == p2)
            return p2_win
        end                
    end

    # Diagonal (from (3, 1) to (1, 3)) line checker
    if (board[1][3] == board[2][2] == board[3][1])
        # Check if diagonal belongs to p1 and if true, return signal showing p1 wins
        if (board[1][3] == board[2][2] == board[3][1] == p1)
            return p1_win 
        # Check if diagonal belongs to p2 and if true, return signal showing p2 wins
        elseif (board[1][3] == board[2][2] == board[3][1] == p2)
            return p2_win
        end                
    end

    # If no one won, check if available cells are 0. If they are 0, it is a tie. Else, the game hasn't ended yet, so return nothing
    if check_available(board) == 0
        return tie
    else
        return nothing
    end
end

# Use minimax algorithm to determine best/worst step
# Board is the game board
# depth is the current recursion depth the algorithm is checking after
# is_maximising shows if the player that just made the move wants to maximise his/her winning chances.

# NOTE: This can be optimised further using alpha-beta pruning to decrease computational complexity
#       and using depth as a factor in deciding score to use fastest way to win, but that's for later.
function minimax(board, depth, is_maximising)
    # Check if game is over (base case)
    result = check_win(board)

    # If game is over, return the score (the win code in this case, which also is the score in that case)
    if result !== nothing
        return result
    # That finishes our base case for recursion. Phew!

    # If player that just made move wants to maximise chances of winning, find best subcase in case of the given move
    elseif is_maximising

        # Initialise best_score at -Inf so every number is greater than that, and the best score is replaced appropriately
        best_score = -Inf

        # Check every vacant spot, place player character in the spot (or cell) we are evaluating and get the best subcase.
        for i in 1:3, j in 1:3
            if board[i][j] == " "

                # Place player character
                board[i][j] = ai
                # Evaluate best subcase (this time is_maximising is false because it is the user's turn and he wants to minimise chances of AI winning)
                # Even if Human doesn't play his/her best move, computer still benefits since it expected a much harder case.
                score = minimax(board, depth + 1, false)

                # Reverse temporary move we made
                board[i][j] = " "

                # If score is better, use this one
                best_score = max(score, best_score)
            end
        end
        # Return the best score so the best case is evaluated.
        return best_score
    else
        # Initialise best_score at Inf so every number is greater than that, and the best score is replaced appropriately
        # This time around, we are simulating the human move by minimising the chances of AI winning.
        best_score = Inf
        
        # Check every vacant spot, place player character in the spot (or cell) we are evaluating and get the best subcase (best for human, worst for AI).
        for i in 1:3, j in 1:3
            if board[i][j] == " "

                # Place player character
                board[i][j] = human
                # Evaluate best subcase (this time is_maximising is true because it is the AI's turn and he wants to maximise chances of AI winning)
                score = minimax(board, depth + 1, true)

                # Reverse temporary move we made
                board[i][j] = " "
                
                # If score is better, use this one
                best_score = min(score, best_score)
            end
        end
        # Return the best score so the best case is evaluated.
        return best_score
    end 
end

# Calculate best move
function best_move(board)
    # Use maximising part of minimax at start to maximise current player's winning chances
    best_score = -Inf

    # Initialise best_pos (index of best move)
    best_pos = (0, 0)

    # Check for vacant spaces, and get best case using minimax.
    for i in 1:3, j in 1:3
        if board[i][j] == " "

            # Place temporary player character
            board[i][j] = ai

            # Evaluate if this is the best move to make using minimax
            score = minimax(board, 0, false)

            # Reverse the temporary changes we made
            board[i][j] = " "

            # If score is better than what we have right now, replace the best score, and set the best_move.
            if score > best_score
                best_score = score
                best_pos = (i, j)
            end
        end
    end

    # Return best position
    return best_pos
end

# Calculate worst move for loser mode
function worst_move(board)

    # Use minimising part of minimax at start to minimise current player's winning chances
    worst_score = Inf

    # Initialise worst_pos (index of worst move)
    worst_pos = (0, 0)

    # Check for vacant spaces, and get worst case using minimax.
    for i in 1:3, j in 1:3

        if board[i][j] == " "
            board[i][j] = ai

            # Minimise AI = Maximise Human. So, is_maximising is true for Human.
            score = minimax(board, 0, true)
            board[i][j] = " "

            # Get worst score and position of move similar to how we did in best_move()
            if score < worst_score
                worst_score = score
                worst_pos = (i, j)
            end
        end
    end

    # Return worst position
    return worst_pos
end

# AI descision tree according to difficulty level selected by Human.
function ai_move!(board, difficulty)

    # If difficulty selected is `loser`, make the AI perform the worst move
    if difficulty == "loser"
        move_pos = worst_move(board)
        make_move!(board, ai, move_pos)

    # If difficulty selected is `easy`, make the AI perform random moves all the time.
    elseif difficulty == "easy"
        if check_available(board) != 0
            move_pos = rand(get_available(board))
            make_move!(board, ai, move_pos)
        end
    
    # If difficulty selected is `medium`, make the AI perform a random move half the time, and the best move the other half of the time
    elseif difficulty == "medium"
        # Use rand to decide if to make random move or smart move
        if rand() <= 0.5
            if check_available(board) != 0
                move_pos = rand(get_available(board))
                make_move!(board, ai, move_pos)
            end
        else
            move_pos = best_move(board)
            make_move!(board, ai, move_pos)
        end
    
    # If difficulty selected is `hard`, make the AI perform a random move a quarter the time, and the best move the rest of the time
    elseif difficulty == "hard"
        # Use rand to decide if to make random move or smart move
        if rand() <= 0.25
            if check_available(board) != 0
                move_pos = rand(get_available(board))
                make_move!(board, ai, move_pos)
            end
        else
            move_pos = best_move(board)
            make_move!(board, ai, move_pos)
        end
    else
        move_pos = best_move(board)
        make_move!(board, ai, move_pos)
    end
end

# Function to print the board with row and column labels
function print_board(board)
    println("  1   2   3")
    println("1 ", join(board[1], " | "))
    println(" ———┼———┼———")
    println("2 ", join(board[2], " | "))
    println(" ———┼———┼———")
    println("3 ", join(board[3], " | "))
end

# Function to make a move for a player at (x, y).
# Assumes that position is not taken. So, moves are checked before being made
# If cell is taken, it just ignores the move.
function make_move!(board, player, (x, y))
    if board[x][y] == " "
        board[x][y] = player
    end
end

# Create function to get user input and recursively validate the user input
function move_input(board, text_to_print, in_same_line, required_params)

    # If we want to print on the same line, use `print()`. Else, `use println()`
    in_same_line ? print(text_to_print) : println(text_to_print)

    # Get input and split it into an array
    txtin = split(lowercase(readline()));

    # Allow users to exit
    if txtin == ["exit"]
        exit()
    end

    # If the required amount of parameters is not met or if indices are out of array, or if place is already taken, ask for input again
    if length(txtin) < required_params || !(txtin[1] in ["1", "2", "3"]) || !(txtin[2] in ["1", "2", "3"]) || board[parse(Int, txtin[1])][parse(Int, txtin[2])] != " "
        println("Please enter a valid command (see README)")
        move_input(board, text_to_print, in_same_line, required_params)
    else
        # If input is valid, return the input as an array of parameters passed to it..
        return txtin
    end
end

# Create function to get user input and recursively validate the user input
function generalised_input(text_to_print, in_same_line, allowed_options, required_params)

    # If we want to print on the same line, use `print()`. Else, `use println()`
    in_same_line ? print(text_to_print) : println(text_to_print)

    # Get input and split it into an array
    txtin = split(lowercase(readline()));

    # Allow user to exit
    if txtin == ["exit"]
        exit()
    end

    # If the required amount of parameters is not met or if the command is not in the list of allowed options,
    # ask for input again
    if length(txtin) < required_params || !(txtin[1] in allowed_options)
        println("Please enter a valid command (see README)")
        generalised_input(text_to_print, in_same_line, allowed_options, required_params)
    else
        # If input is valid, return the input as a string.
        return join(txtin, " ")
    end
end

# Ask if user wants to play again
function play_again()

    # Get user input for whether he/she wants to play again
    ans = generalised_input("Play again? (y/n): ", true, ["y", "n"], 1)

    # If user wants to play again, run the game again. Else, exit()
    if ans == "y"
        # Run this same script in a new instance, and exit this instance of this script
        run(`julia $PROGRAM_FILE`)
        exit()
    else
        # Exit
        exit()
    end
end

# Start multiplayer game
function start_multiplayer_game()
    # Print starting text
    println("Player 1 (X) goes first. Player 2 (O) goes after Player 1. \nType `exit` to exit the game whenever you want.")

    while true
        # Print current state of board
        print_board(board)

        # Get player 1 input for cell to play in after input scrubbing
        txt = move_input(board, "Player 1, enter row and column seperated by space: ", true, 2)

        # Perform move player 1 requested.
        make_move!(board, player1, (parse(Int, txt[1]), parse(Int, txt[2])))

        # Check for win, and print appropriate text.
        if (check_win(board) in [tie, player1_win, player2_win])

            # Print board after le epic ending move
            print_board(board)

            # Print appropriate text
            if check_win(board) == player1_win
                println("Player 1 Wins!")
            elseif check_win(board) == player2_win
                println("Player 2 Wins!")
            else
                println("Tie.")
            end

            # Break out of while loop to end game
            break
        end
        
        # If no one won yet, print the board and move to Player 2's move
        print_board(board)

        # Get player 2 input for cell to play in after input scrubbing
        txt = move_input(board, "Player 2, enter row and column seperated by space: ", true, 2)

        # Perform move player 2 requested.
        make_move!(board, player2, (parse(Int, txt[1]), parse(Int, txt[2])))

        
        # Check for win, and print appropriate text.
        if (check_win(board) in [tie, human_win, ai_win])
            
            # Print board after le epic ending move
            print_board(board)
            
            # Print appropriate text
            if check_win(board) == human_win
                println("Human wins. There is hope! The humans are still worthy!")
            elseif check_win(board) == ai_win
                println("AI wins. AI is going to take over. We're practically dead.")
            else
                println("Tie. Have we reached the singularity?")
            end
            
            # Break out of while loop to end game
            break
        end
    end

    # After ending game, ask if user wants to play again.
    play_again()
end

# Start multiplayer game
function start_singleplayer_game()
    # Print difficulty select
    difficulty = """
    You will be playing as X. The computer is O.
    Type `exit` to exit the game whenever you want.

    Select difficulty:
    - `loser`: AI always makes worst move
    - `easy`: AI plays randomly
    - `medium`: AI plays smart, but still makes mistakes.
    - `hard`: AI plays smarter, makes less mistakes.
    - `impossible`: AI always makes best move. Impossible to win this.
    """

    # Get difficulty selected after user input scrubbing
    diff_selected = generalised_input(difficulty, true, ["loser", "easy", "medium", "hard", "impossible"], 1)

    # Start singleplayer game
    while true

        # Print current state of board
        print_board(board)

        # Get human input after scrubbing
        txt = move_input(board, "Enter row and column seperated by space: ", true, 2)

        # Perform human move
        make_move!(board, human, (parse(Int, txt[1]), parse(Int, txt[2])))
        
        # Check for win, and print appropriate text.
        if (check_win(board) in [tie, human_win, ai_win])

            # Print current state of board after le epic final move
            print_board(board)

            # Print appropriate text after end of game
            if check_win(board) == human_win
                println("Human wins. There is hope! The humans are still worthy!")
            elseif check_win(board) == ai_win
                println("AI wins. AI is going to take over. We're practically dead.")
            else
                println("Tie. Have we reached the singularity?")
            end

            # Break out of while loop to end game.
            break
        end

        # If no one won yet, allow AI to make move according to difficulty selected.
        ai_move!(board, diff_selected)

        # Check for win, and print appropriate text.
        if (check_win(board) in [tie, human_win, ai_win])
            
            # Print current state of board after le epic final move
            print_board(board)

            # Print appropriate text after end of game
            if check_win(board) == human_win
                println("Human wins. There is hope! The humans are still worthy!")
            elseif check_win(board) == ai_win
                println("AI wins. AI is going to take over. We're practically dead.")
            else
                println("Tie. Have we reached the singularity?")
            end
            
            # Break out of while loop to end game.
            break
        end
    end

    # Ask if human wants to play again.
    play_again()
end

# Start game and ask for choice of game mode
mode = generalised_input("Welcome to TicTacToe! Would you like to play singleplayer (1) or multiplayer (2)?", false, ["1", "2"], 1)

# Check mode after scrubbing and start appropriate game mode.
if mode == "1"
    start_singleplayer_game()
else    
    start_multiplayer_game()
end
