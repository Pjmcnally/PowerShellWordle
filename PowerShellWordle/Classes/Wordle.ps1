class Wordle {
    [string]$GameWord
    [System.Collections.ArrayList]$guesses
    [array]$AnswerWords
    [System.Collections.Generic.HashSet[string]]$legalGuessWords
    [bool]$Playing

    Wordle($answerWords, $legalGuessWords) {
        $this.AnswerWords = $answerWords
        $this.LegalGuessWords = $legalGuessWords
    }

    [void]SetRandomGameWord() {
        $this.GameWord = $this.answerWords | Get-Random
    }

    [void]ReadGuess() {
        $guess = Read-Host "Please enter your guess (or enter 'quit' to quit)"

        while ((-not $this.legalGuessWords.contains($guess)) -and ($null -ne $guess)) {
            $guess = $guess.ToUpper().Trim()

            if ($guess -eq 'QUIT') {
                $guess = $null
            } elseif (-not $this.legalGuessWords.contains($guess)) {
                # TODO: Overwrite the previous line instead of adding a new line to the terminal.
                # TODO: Add feedback for why guess is invalid (ie contains number or symbols or too many letters)
                # TODO: prevent user from making same guess twice
                $guess = Read-Host "Sorry, that guess is invalid. Please try again (or enter 'quit' to quit)"
            }
        }

        $guessObj = New-Guess $guess
        $this.guesses.Add($guessObj)
    }

    [Void]SetupGame() {
        Clear-Host
        $this.SetRandomGameWord()
        $this.guesses = [System.Collections.ArrayList]::new()
        $this.playing = $true
    }

    [void]RunGame() {
        # TODO: Add player name parameter to New-Wordle
        # TODO: Record player's average score & recall based on player
        # TODO: create a database or use some other sort of storage
        # TODO: Add doc strings to each function
        # TODO: conform everything to a standard formatting
        $this.SetupGame()

        while ($this.playing) {
            $newGuess = Read-Guess
            [void]$this.guesses.Add($newGuess)

            if ($newGuess.Equals($this.GameWord)) {
                Show-Result -correctWord $this.GameWord -guesses $this.guesses -winner
                $this.playing = $false
            } elseif ($newGuess.IsEmpty()) {
                $this.playing = $false
            } else {
                Show-Result -correctWord $this.GameWord -guesses $this.guesses
            }
        }
    }
}
