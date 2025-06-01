param (
    [switch]$Yes
)

# --- Check for Admin Privileges ---
function Test-IsAdmin {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# --- Relaunch Script with Admin Rights if Needed ---
if (-not (Test-IsAdmin)) {
    Write-Host "🔐 Relaunching script with administrative privileges..."
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# --- Disk Cleanup ---
function Invoke-DiskCleanup {
    Write-Host "🧹 Running Disk Cleanup..."
    Start-Process cleanmgr -ArgumentList "/sagerun:1" -Wait
}

# --- Windows Update ---
function Invoke-WindowsUpdate {
    Write-Host "🌐 Installing and checking Windows updates..."
    try {
        if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
            Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser
        }
        Import-Module PSWindowsUpdate -Force
        Get-WindowsUpdate -AcceptAll -Install -IgnoreReboot
    } catch {
        Write-Warning "⚠️ Failed to install or execute Windows Update: $_"
    }
}

# --- Defragment Disk (Only if Not SSD) ---
function Invoke-DiskOptimization {
    try {
        $drive = Get-PhysicalDisk | Where-Object { $_.DeviceID -eq 0 } # Adjust if needed
        if ($drive.MediaType -ne "SSD") {
            Write-Host "💽 Optimizing disk (non-SSD)..."
            Optimize-Volume -DriveLetter C -Verbose -Confirm:$false
        } else {
            Write-Host "⚡ SSD detected, skipping defragmentation."
        }
    } catch {
        Write-Warning "⚠️ Disk optimization failed: $_"
    }
}

# --- Antivirus Quick Scan ---
function Invoke-AntivirusScan {
    $status = Get-MpComputerStatus
    if ($status.AMRunningMode -ne "Passive") {
        Write-Host "🛡️ Running quick antivirus scan..."
        Start-MpScan -ScanType QuickScan
    } else {
        Write-Host "🛑 Defender in passive mode or scan already in progress. Skipping scan."
    }
}

# --- Set High Performance Power Plan ---
function Set-HighPerformancePowerPlan {
    Write-Host "⚡ Setting power plan to High Performance..."
    powercfg -setactive SCHEME_MAX
}

# --- Main Execution ---
Write-Host "`n🚀 Starting System Optimization..." -ForegroundColor Cyan
Invoke-DiskCleanup

Write-Host "🧭 Please manually disable unnecessary startup programs via Task Manager."

if ($Yes) {
    Invoke-WindowsUpdate
}

Invoke-DiskOptimization
Invoke-AntivirusScan
Set-HighPerformancePowerPlan

Write-Host "`n✅ System optimization completed!" -ForegroundColor Green
