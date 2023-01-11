Set-StrictMode -Version Latest

# Setup classes - This must be done manually as import order is important
$Classes = @()

# Get public and private function definition files.
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
ForEach($import in @($Classes + $Public + $Private))
{
    Try
    {
        . $import.FullName
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.FullName): $_"
    }
}
 
$answerWords = Get-Content -Path "$PSScriptRoot\Data\AnswerWords.txt"

# Here I might...
# Read in or create an initial config file and variable
# Export Public functions ($Public.BaseName) for WIP modules
# Set variables visible to the module and its functions only

# Export-ModuleMember -Function $Public.Basename
