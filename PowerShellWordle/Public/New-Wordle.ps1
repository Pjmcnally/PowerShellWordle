function New-Wordle {
    # TODO: Add player name parameter to New-Wordle
    # TODO: Record player's average score & recall based on player
    # TODO: create a database or use some other sort of storage
    # TODO: Add doc strings to each function
    # TODO: conform everything to a standard formatting
    Clear-Host  
    $selectWord = Select-Word
    $guesses = [System.Collections.ArrayList]::new()
    $playing = $true

    while ($playing) {
        $newGuess = Read-Guess
        [void]$guesses.Add($newGuess)
        
        if ($newGuess.Equals($selectWord)) {
            Show-Result -correctWord $selectWord -guesses $guesses -winner
            $playing = $false
        } elseif ($newGuess.IsEmpty()) {
            $playing = $false
        } else {
            Show-Result -correctWord $selectWord -guesses $guesses
        }        
    }
}
