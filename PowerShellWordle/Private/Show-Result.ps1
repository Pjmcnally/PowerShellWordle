function Show-Result {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$correctWord,

        [Parameter(Mandatory=$true)]
        [System.Collections.ArrayList]$guesses,

        [Parameter()]
        [switch]$winner
    )
    # TODO Display letter bank and indicate which letters have been guessed.
    # TODO Look into how double letters are handled and clarify our display

    $correctWordSet = [System.Collections.Generic.HashSet[string]]($correctWord.ToCharArray())

    Clear-Host
    foreach ($guess in $guesses) {
        $i = 0
        foreach ($letter in $guess.toCharArray()) {
            if ($letter -eq $correctWord[$i]) {
                $backgroundColor = 'DarkGreen'
                $foregroundColor = 'Black'
            } elseif ($correctWordSet.Contains($letter)) {
                $backgroundColor = 'DarkYellow'
                $foregroundColor = 'Black'
            } else {
                $backgroundColor = 'Black'
                $foregroundColor = 'White'
            }
            $i += 1
            Write-Host $letter -ForegroundColor $foregroundColor -BackgroundColor $backgroundColor -NoNewline
        }
        Write-Host # Adds a line break after each word is complete
    }

    if ($winner) {
        Write-Host "Congrats! You won the game. It took you $($guesses.count) tries to get the correct answer."
    }
}
