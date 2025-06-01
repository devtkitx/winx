param (
    [Parameter(Position=0)]
    [string]$Command,

    [Parameter(Position=1)]
    [string]$Subcommand,

    [Parameter(Position=2)]
    [string[]]$Args
)

function Show-Usage {
    Write-Host ""
    Write-Host "🧰 WinX CLI - Windows Developer Tools & Automation" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage:"
    Write-Host "  winx <command> <subcommand> [options]"
    Write-Host ""
    Write-Host "Examples:"
    Write-Host "  winx system optimize -Yes"
    Write-Host "  winx tools install node"
    Write-Host ""
    Write-Host "Available commands:"
    Write-Host "  help                 Show usage"
    Write-Host "  system optimize      Run system performance tools"
    Write-Host "  system update        Check/install Windows updates"
    Write-Host "  tools install        Install developer tools"
    Write-Host ""
}

# Default to help if no command is provided
if (-not $Command) {
    Show-Usage
    exit 0
}

# Path resolution
$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition
$commandPath = Join-Path $scriptRoot "commands/$Command"

# Handle help
if ($Command -eq "help") {
    Show-Usage
    exit 0
}

# If subcommand exists, resolve full path
if ($Subcommand) {
    $targetScript = Join-Path $commandPath "$Subcommand.ps1"
} else {
    $targetScript = Join-Path $commandPath "default.ps1"
}

# Validate command existence
if (-Not (Test-Path $targetScript)) {
    Write-Host "❌ Unknown command: $Command $Subcommand" -ForegroundColor Red
    Show-Usage
    exit 1
}

# Forward execution
& $targetScript @Args
