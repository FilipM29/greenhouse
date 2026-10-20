# Greenhouse

iOS app for one household to track watering, feeding and repotting of houseplants, with photo diagnosis via the Claude API.

Work in progress.

## Build it yourself

Requirements: Xcode 26, [XcodeGen](https://github.com/yonaskolb/XcodeGen) and [gitleaks](https://github.com/gitleaks/gitleaks).

```sh
brew install xcodegen gitleaks
./scripts/install-hooks.sh
cp Config/Local.xcconfig.example Config/Local.xcconfig   # then fill in your Team ID and bundle prefix
xcodegen generate
open Greenhouse.xcodeproj
```

`Config/Local.xcconfig` is git-ignored. The Xcode project is generated from `project.yml` and is not committed.
