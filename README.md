# PwrX ⚡
Advanced PowerShell Utilities for Windows Automation & Scripting

**PwrX** is a PowerShell-based CLI toolkit designed to automate Windows system setup, optimization, and developer tooling — especially for fresh installations or reproducible environments.

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

## Project Structure

```bash
pwrx/
├── scripts/
│   ├── pwrx.ps1                # Main CLI entrypoint
│   ├── commands/
│   │   ├── help.ps1            # CLI help
│   │   ├── system/
│   │   │   ├── optimize.ps1    # Optimization routines
│   │   │   └── update.ps1      # Windows Update handler
│   │   └── tools/
│   │       └── install.ps1     # Install Git, Node, etc.
├── pwrx.ps1                    # Root-level shim (optional)
├── README.md
└── docs/
    └── contributing/
        └── directory-structure.md
```

## Adding New Commands

Add subcommands under the `scripts/commands/<namespace>/` folder:

Example:

```bash
scripts/
└── commands/
    └── system/
        └── optimize.ps1  # pwrx system optimize
```

## Contributing

Please review [CONTRIBUTING.md](CONTRIBUTING.md) for naming conventions and structure before submitting changes.

## License

MIT © 2025 - The WinX Maintainers
