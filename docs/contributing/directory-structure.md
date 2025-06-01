# Directory Structures in Winx

This document explains the organization of the Winx project repository, designed to promote modularity, maintainability, and ease of collaboration.

## Repository Root

- `PSWinx/`  
  Contains the core PowerShell module files and folders.

### Inside `PSWinx/`

- `en-US/`  
  Localization folder holding help files (`about_PSWinx.help.txt`) to provide rich context-sensitive help in PowerShell.

- `Private/`  
  Internal helper functions and scripts that are **not exported** to the user. These are reusable utilities encapsulated to maintain module integrity.

- `Public/`  
  The main user-facing functions that define the CLI commands exposed by the module. These scripts are loaded and made available for interactive use.

- `lib/` _(optional)_  
  Any external DLLs or libraries the module depends on.

- `bin/` _(optional)_  
  External executables or tools shipped with the module.

- `PSWinx.Format.ps1xml`  
  Custom formatting files to enhance output presentation in PowerShell.

- `PSWinx.psd1`  
  The module manifest file containing metadata, versioning, and exported members.

- `PSWinx.psm1`  
  The main module script file which imports and exports functions from `Public` and `Private` folders.

## Additional Folders and Files

- `Tests/`  
  Contains automated tests using Pester to ensure code quality and prevent regressions.

- `README.md`  
  Provides an overview, installation instructions, and usage examples.

- `LICENSE`  
  The license under which Winx is distributed (MIT License recommended).

- `AppVeyor.yml` _(optional)_  
  Continuous Integration configuration for automated testing on Windows.

---

This structure aims to keep code cleanly separated, facilitate localization, support testing, and provide a professional developer experience.
