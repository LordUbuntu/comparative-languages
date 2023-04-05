# Jacobus Burger
# CMPT 360A, Spring 2021
# Lab Assignment 5
# The Game of Nim in Nim
import strutils, strformat


# the game of nim, written in the nim language
proc nim(rounds, stones_per_round: int) =
  var
    player_move: int  # how many stones the player takes
    robot_move: int  # how many stones the robot takes
    remaining: int  # how many stones remain in the game
    max_move: int = stones_per_round - 1
    min_move: int = 1

  remaining = stones_per_round * rounds
  echo fmt"Starting game with {remaining} stones."
  echo fmt"Dr. Nim: Remember to have fun, even though you will lose ;^)"

  while remaining > 0:
    try:
      echo fmt"How many stones will you take [1-{max_move}]?"
      player_move = stdin.readline.parseInt
    except:
      # not really an exception, moreso to deal with erroneous user input
      echo fmt"Input provided was not valid! Set to maximum `{max_move}`."
      player_move = max_move
    finally:
      # bind valid input to valid range
      if player_move > max_move:
        echo fmt"Input provided was too high, set to {max_move}."
        player_move = max_move
      elif player_move < min_move:
        echo fmt"Input provided was too low, set to {min_move}."
        player_move = min_move

      # determine robot_move action for win in normal play (last-move-wins) style
      robot_move = stones_per_round - player_move

      # finish turn
      remaining -= (robot_move + player_move)
      echo fmt"You took: {player_move}"
      echo fmt"Dr. Nim took: {robot_move}"
      echo fmt"Remaining stones: {remaining}"
  # end the game
  echo fmt"Dr. Nim wins!"  # note: robot_move always wins


nim(3, 4)  # standard fare game of nim  (rounds, stones_per_round)



# notes:
# robot is always able to win because the number of stones can be divided into even sections often, and thus whoever goes first will always lose if their opponent takes the remaining number of stones in each grouping so that the first one always goes first for each grouping. There is a video that goes into detail about this. The game doesn't need to know who took the last stone, since the robot will always go last and always take the remainder, reliably winning no matter what the opponent does.
# nim requires exception handling to validate bad input like incorrect letters etc. Program operation is not interrupted by this though, instead it assumes a default value and continues unabated

