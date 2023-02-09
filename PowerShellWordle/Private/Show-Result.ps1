function Show-Result {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$correctWord,

        [Parameter(Mandatory=$true)]
        [array]$guesses,

        [Parameter()]
        [switch]$winner
    )

    $correctWordSet = [System.Collections.Generic.HashSet[string]]($correctWord.ToCharArray())

    Clear-Host
    $foregroundColor = 'White'
    $backgroundColor = 'Black'
    foreach ($guess in $guesses) {
        $i = 0
        foreach ($letter in $guess.toCharArray()) {
            if ($letter -eq $correctWord[$i]) {
                $foregroundColor = 'DarkGreen'
            } elseif ($correctWordSet.Contains($letter)) {
                $foregroundColor = 'DarkYellow'
            } else {
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
