function Select-Word {
    # $answerWords is a variable associated with the module that contains all the possible answer words. It is populated at module import.
    Return $answerWords | Get-Random
}
