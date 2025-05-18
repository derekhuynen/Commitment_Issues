# Commitment Issues
This project is a playful script designed to create fake commits in a Git repository. It automates the process of generating commits for a specified number of past days, updating a file with incremental numbers to simulate activity.

## How It Works

1. **Script Location**: The script is located in the `scripts` folder and is named `create_commits.ps1`.
2. **Git Repository Check**: The script ensures it is run inside a valid Git repository.
3. **Start Date**: The script assumes today's date as the starting point.
4. **User Input**: You are prompted to enter the number of days for which you want to create commits.
5. **Update File**: A file named `update_file.txt` is used to track incremental numbers. If it doesn't exist, it is created.
6. **Commit Loop**: For each day in the specified range:
   - The script calculates the commit date.
   - Updates the `update_file.txt` with a new number.
   - Stages and commits the file with the calculated date.

## Prerequisites

- A valid Git repository.
- PowerShell installed on your system.

## Usage

1. Clone or navigate to your Git repository.
2. Run the script using PowerShell:
   ```powershell
   powershell -ExecutionPolicy Bypass -File scripts\create_commits.ps1
   ```
3. Enter the number of days for which you want to create commits.

## Example

If you enter `10`, the script will:

- Create 10 commits for the past 10 days.
- Update `update_file.txt` with incremental numbers.

## Disclaimer

This script is for educational and entertainment purposes only. Use responsibly and avoid misleading others with fake commit histories.
