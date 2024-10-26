function New-Wordle {
    return [Wordle]::new($answerWords, $legalGuessWords)
}
