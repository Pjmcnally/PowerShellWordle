# PowerShellWordle

## Overview

This project is recreating Wordle in the command line using PowerShell. The goal of the project is just to learn and practice PowerShell.

Wordle is a word game in which the user attempts to guess a random word. The game will indicate which letters the user has correct and the user will continue to guess until they land on the correct word. [Official Wordle website](https://www.nytimes.com/games/wordle/index.html).

## Design

Design description.

### MVP

The user will be able to run a command to start the game. The script will select a random 5 letter word which the user will attempt to guess. The script will take user input, allowing them to guess a word. The game will show the user which letters they have correct, if any, and whether each letter is in the correct position. The game will continue until the user guesses the word correctly and will show the user how many attempts it took for them to win.

### Implementation

This will be built as a PowerShell module which will include the following commands.

* New-Wordle
  * Summary: Starts the game.
  * Parameters: None for now. May add the ability to specify a random game or the daily game in the future.
  * Returns: None.
* Select-Word
  * Summary: Selects the word from the list Wordle words.
  * Parameters: None for now. May add the ability to specify a random game or the daily game in the future.
  * Returns: Word.
* Read-Guess
  * Summary: Reads the user's inputted guess and verifies it is a valid word.
  * Parameters: None
  * Returns: Guess.
* Show-Result
  * Summary: Show the user the current state of the game
  * Parameters: Correct Word, List of user guesses
  * Returns: None.

## Current Status

Current goal is to write the New-Wordle function.
