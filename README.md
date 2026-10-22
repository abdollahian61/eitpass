# EITPass

Branded Windows desktop client for Passbolt.

- Product: **EITPass**
- Publisher: **Fanavaran Etelaat Khebreh**
- Server: **https://vault.eitdmz.ir**
- Upstream: https://github.com/passbolt/passbolt-windows

## Build strategy

This repository contains branding and build automation, not a vendored copy of Passbolt. The workflow checks out a pinned upstream revision, inspects the UWP project, applies the branding overlay, and builds using MSBuild on a Windows runner.

**Important:** The workflow is a starting point and has not yet produced a validated release. MSI/EXE packaging requires validation of UWP package identity and runtime dependencies. Do not distribute unsigned packages.

## Requirements

- Passbolt server API >= 4.2
- Desktop plugin enabled on the Passbolt server
- Windows signing certificate for MSIX deployment
- Windows runner with Visual Studio UWP build tools

See [Build documentation](docs/build.md).

## Security

Never commit signing keys, account kits, passphrases, or private keys. Verify upstream changes before adopting a new revision. The server URL is not a credential.
