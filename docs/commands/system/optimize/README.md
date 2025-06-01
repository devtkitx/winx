# Optimize Command

The `optimize` command is part of the WinX CLI toolkit, designed to enhance system performance through various optimization tasks.

## Usage

```powershell
.\winx.ps1 system optimize [-y | -yes]
```

### Parameters

- `-y` or `-yes`: Automatically install the `PSWindowsUpdate` module if not present.

## What It Does

1. **Checks Admin Privileges** and relaunches if needed
2. **Runs Disk Cleanup** (`cleanmgr /sagerun:1`)
3. Prompts to manually **disable startup programs**
4. **Installs and runs Windows Update** if `-y` is passed
5. **Optimizes disk** (`Optimize-Volume`)
6. **Runs antivirus scan** (if Defender is active)
7. **Sets High Performance power plan**

## Requirements

- Run as Administrator
- Windows 10/11
- Internet connection (for updates)

## Example

```powershell
.\winx.ps1 system optimize -yes
```
