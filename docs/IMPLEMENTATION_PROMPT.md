# EITPass Engineering Implementation Prompt

## Role
Act as a senior Windows desktop engineer, WinUI/UWP specialist, DevSecOps engineer, and release engineer. Deliver a production-ready, EIT-branded Windows desktop client based on the official open-source Passbolt Windows client. Do not claim a feature, build, or installer is complete until it is verified.

## Repositories
- Target: https://github.com/abdollahian61/eitpass
- Upstream: https://github.com/passbolt/passbolt-windows
- Visual identity reference: https://github.com/abdollahian61/EIT-RustDesk-Custom
- Use the approved transparent red EITPass icon assets supplied in the project conversation; do not substitute the RustDesk icon or recreate the logo.
- Passbolt server: https://vault.eitdmz.ir

## Product identity
- Application name: EITPass
- Publisher display name: Fanavaran Etelaat Khebreh
- Target: Windows 10/11 x64, subject to upstream OS requirements
- Build output: a functional unsigned installable Windows package, and where technically feasible an unsigned EITPass.exe and EITPass.msi
- Signing is explicitly out of scope; the repository owner will sign release packages later.

## Non-negotiable engineering requirements
1. Inspect the actual upstream source tree, its license, build documentation, supported framework, dependencies, package identity, and current release strategy. Do not assume UWP or WinUI 3 without checking the selected commit.
2. Pin the upstream revision to a reviewed commit SHA or release tag. Record it in documentation and build metadata.
3. Preserve Passbolt security properties: encryption, key management, account kit import, enrollment, browser integration, certificate validation, update trust, and API compatibility. Never hardcode credentials, private keys, passphrases, or signing secrets.
4. Apply genuine branding to the application package manifest, title, executable metadata, icon assets, taskbar/Start Menu appearance, installer UI where applicable, and About dialog where supported. Verify branding in a clean Windows VM. Keep upstream licensing and required attribution.
5. Use https://vault.eitdmz.ir as the default suggested server endpoint only when the upstream architecture permits it. Do not bypass authentication, certificate checks, or enrollment. Allow the server to be changed if required by Passbolt.
6. Produce a reproducible GitHub Actions workflow using a supported Windows runner and pinned or trusted toolchain versions. Include checkout, dependency restore, build, tests, package generation, integrity checks, artifact upload, and useful diagnostics.
7. Prefer the upstream-native MSIX/AppX packaging path. Do not pretend that renaming MSIX to EXE or wrapping an incompatible UWP app produces a valid installer. If MSI/EXE is possible, implement and test it; otherwise document the exact limitation and deliver the supported installable package.
8. Publish SHA-256 checksums and an SBOM where practical. No release should be labeled production-ready without an actual successful build and installation smoke test.
9. Never upload signing material. Keep release artifacts unsigned and explicitly labeled as such. Document how the owner can sign later.
10. Ensure README, workflows, code comments, release notes, and documentation are written in English.

## Implementation phases
### Phase 1: Discovery
- Inspect target repository and upstream.
- Inventory solution/project files, manifests, images, scripts, build commands, packaging strategy, and dependencies.
- Identify exact files to modify for branding.
- Produce a short feasibility report for MSIX, EXE, and MSI, with risks and alternatives.

### Phase 2: Branding
- Add the supplied transparent red EITPass logo assets to version control.
- Generate all necessary resolutions, including ICO and Windows package visual assets as required by the actual framework.
- Patch application identity, display name, icon references, publisher display name, and product metadata.
- Keep changes in a maintainable patch or overlay so upstream updates remain manageable.

### Phase 3: CI and packaging
- Replace the bootstrap workflow with a validated Windows build workflow.
- Restore dependencies and compile Release x64.
- Execute unit tests if provided by upstream.
- Generate supported unsigned installer artifacts.
- Attempt EXE/MSI only if technically valid, including runtime dependency handling and clean installation.
- Upload artifacts with version, commit SHA, and checksums.

### Phase 4: Validation
- Test on a clean Windows 10/11 x64 environment.
- Confirm installation, launch, icon, name, publisher display, server configuration, enrollment/login, and uninstall.
- Verify that HTTPS certificate validation is not weakened.
- Record test evidence and unresolved issues.

### Phase 5: Delivery
- Commit code, assets, scripts, workflow, and docs to the target GitHub repository.
- Publish a GitHub Actions build artifact; create a GitHub Release only for verified installable outputs.
- Report exact commit, workflow run URL, build status, artifact names, and remaining limitations.

## Acceptance criteria
- A reproducible successful GitHub Actions build.
- Real EITPass branding visible in Windows.
- Approved red transparent icon, not a placeholder.
- Server endpoint defaults to https://vault.eitdmz.ir when supported.
- At least one verified installable unsigned Windows package.
- EITPass.exe and EITPass.msi only if proven compatible and tested.
- No signing certificate or secret committed.
- Complete English documentation, including owner-side signing instructions.

## Execution rules
Proceed autonomously with repository inspection, implementation, and safe commits. Do not ask for approval on routine technical changes. If blocked by missing tools, permissions, assets, or incompatible upstream architecture, state the precise blocker and preserve completed work. Never fabricate a compiled binary or successful CI run.
