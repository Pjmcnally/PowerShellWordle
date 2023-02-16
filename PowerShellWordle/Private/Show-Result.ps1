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

    Clear-Host
    foreach ($guess in $guesses) {
        $guess.Display($correctWord)
    }

    if ($winner) {
        Write-Host "Congrats! You won the game. It took you $($guesses.count) tries to get the correct answer."
    }
}
