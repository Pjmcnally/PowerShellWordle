function Read-Guess {
    $guess = Read-Host "Please enter your guess (or enter 'quit' to quit)"

    while ((-not $guessWords.contains($guess)) -and ($null -ne $guess)) {
        $guess = $guess.ToUpper()
        
        if ($guess -eq 'QUIT') {
            $guess = $null
        } elseif (-not $guessWords.contains($guess)) {
            # TODO: Overwrite the previous line instead of adding a new line to the terminal.
            $guess = Read-Host "Sorry, that guess is invalid. Please try again (or enter 'quit' to quit)"
        }
    }

    Return $guess
}
