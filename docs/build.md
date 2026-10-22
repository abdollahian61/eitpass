# EITPass build and release

## Server configuration

Set `PASSBOLT_PLUGINS_DESKTOP_ENABLED=true` for Docker deployments. For other deployments, enable the Passbolt desktop plugin in `/etc/passbolt/passbolt.php`. The desktop app requires Passbolt API 4.2 or later.

Users still import their own Passbolt account kit. Setting the server URL does not bypass enrollment or account verification.

## Build

Run **Actions > Build EITPass > Run workflow**. The workflow clones the official Windows app, restores dependencies, and attempts an x64 Release build. The exact upstream revision should be pinned after validation.

The branding overlay currently provides metadata and the expected server URL. It does **not** automatically patch upstream UI or account enrollment flows. Those changes require inspecting and testing upstream source code.

## Signing and packaging

MSIX identity must match the certificate subject. Use an organization-issued code signing certificate. Keep certificate material in GitHub Actions secrets and never print it in logs.

Do not assume a UWP MSIX bundle can be repackaged into an ordinary MSI/EXE without consequences. Validate packaging, updates, dependencies, and uninstall behavior on clean Windows 10/11 machines before publishing installers.

## Release checklist

1. Pin and review the upstream commit.
2. Validate the branded application name, icon, and publisher.
3. Verify server enrollment against https://vault.eitdmz.ir.
4. Sign the package with the organization certificate.
5. Test installation, login, upgrades, and removal.
6. Publish only tested, signed artifacts.
