class Guess {
    [string]$Word

    Guess() {
        $this.Word = ''
    }
    
    Guess([string]$Word) {
        $this.Word = $Word
    }
    
    [bool] IsEmpty() {
        Return $this.Word.Length -eq 0
    }

    [bool] Equals ([string]$word) {
        Return $this.Word -eq $word
    }

    [void] Display([string]$correctWord) {
        $i = 0
        $correctWordSet = [System.Collections.Generic.HashSet[string]]($correctWord.ToCharArray())

        foreach ($letter in $this.Word.toCharArray()) {
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
}
