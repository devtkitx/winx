# WinX CLI

**WinX** is a PowerShell-based CLI toolkit designed to automate Windows system setup, optimization, and developer tooling — especially for fresh installations or reproducible environments.

> Built for Windows power users, system integrators, and developers who want automation with control.

## Features

- One-click system optimization
- Windows Update automation
- Developer toolchain bootstrapping
- Power plan & security configuration
- Modular and extensible CLI architecture

## Getting Started

### Prerequisites

- Windows 10 or 11
- PowerShell ≥ 5.1 (also supports PowerShell Core 7+)
- Administrator rights for system-level tasks

## Usage

Run the CLI from PowerShell:

```powershell
.\scripts\winx.ps1 <command> <subcommand> [options]
```

Or use it via explicit invocation from any shell:

```powershell
powershell -ExecutionPolicy Bypass -File ./scripts/winx.ps1 <command> <subcommand> [options]
```

You can also use the root shim:

```powershell
.\winx.ps1 <command> <subcommand> [options]
```

## Project Structure

```bash
winx/
├── scripts/
│   ├── winx.ps1                # Main CLI entrypoint
│   ├── commands/
│   │   ├── help.ps1            # CLI help
│   │   ├── system/
│   │   │   ├── optimize.ps1    # Optimization routines
│   │   │   └── update.ps1      # Windows Update handler
│   │   └── tools/
│   │       └── install.ps1     # Install Git, Node, etc.
├── winx.ps1                    # Root-level shim (optional)
├── README.md
└── docs/
    └── contributing/
        └── directory-structure.md
```

## Examples

```powershell
# Optimize system performance
.\scripts\winx.ps1 system optimize -Yes

# Check for and install Windows updates
.\scripts\winx.ps1 system update
```

## Adding New Commands

Add subcommands under the `scripts/commands/<namespace>/` folder:

Example:

```bash
scripts/
└── commands/
    └── system/
        └── optimize.ps1  # winx system optimize
```

You can then invoke:

```powershell
.\scripts\winx.ps1 ssh generate
```

## Contributing

Please review [CONTRIBUTING.md](CONTRIBUTING.md) for naming conventions and structure before submitting changes.

## License

MIT © 2025 - The WinX Maintainers
