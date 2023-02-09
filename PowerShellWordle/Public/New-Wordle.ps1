function New-Wordle {
    $selectWord = Select-Word
    $guesses = @()
    $playing = $true

    while ($playing) {
        $readGuess = Read-Guess
        # TODO: Change this to a different data type
        $guesses += $readGuess
        
        if ($readGuess -eq $selectWord) {
            Show-Result -correctWord $selectWord -guesses $guesses -winner
            $playing = $false
        } elseif ($null -eq $readGuess) {
            $playing = $false
        } else {
            Show-Result -correctWord $selectWord -guesses $guesses
        }        
    }
}
