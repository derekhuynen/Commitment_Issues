# Ensure the script is run inside a Git repository
if (-not (Test-Path ".git")) {
    Write-Error "This script must be run inside a Git repository."
    exit 1
}

# Assume today's date as the start date
$startDate = Get-Date

# Prompt user for the number of days
$daysToCommit = Read-Host "Enter the number of days to add commits"

# Validate input for number of days
if (-not [int]::TryParse($daysToCommit, [ref]$null)) {
    Write-Error "Invalid number of days. Please enter a valid integer."
    exit 1
}

# Create or update the update file
$updateFileName = "update_file.txt"
if (-Not (Test-Path $updateFileName)) {
    "0" | Out-File -Encoding UTF8 $updateFileName
}

# Loop through the specified number of days
for ($i = 1; $i -le $daysToCommit; $i++) {
    $commitDate = $startDate.AddDays(-$i).ToString("yyyy-MM-dd HH:mm:ss")

    # Update the number in the update file
    $currentNumber = Get-Content $updateFileName | ForEach-Object { [int]$_ }
    $newNumber = $currentNumber + 1
    $newNumber | Out-File -Encoding UTF8 $updateFileName

    # Stage and commit the update file
    git add $updateFileName
    $env:GIT_AUTHOR_DATE = $commitDate
    $env:GIT_COMMITTER_DATE = $commitDate
    git commit -m "Updated $updateFileName to $newNumber on $commitDate"

    Write-Host "Updated and committed $updateFileName with number $newNumber for date $commitDate"
}

Write-Host "All commits created successfully!"