## 0.0.7 (unreleased)

### Added

### Changed

- Use `expect_test_helpers_core.expect_test_helpers_base`.

### Deprecated

### Fixed

### Removed

## 0.0.6 (2024-07-26)

### Added

- Added dependabot config for automatically upgrading action files.

### Changed

- Upgrade `ppxlib` to `0.33` - activate unused items warnings.
- Upgrade `ocaml` to `5.2`.
- Upgrade `dune` to `3.16`.
- Upgrade base & co to `0.17`.

## 0.0.5 (2024-03-13)

### Changed

- Uses `expect-test-helpers` (reduce core dependencies)
- Run `ppx_js_style` as a linter & make it a `dev` dependency.
- Upgrade GitHub workflows `actions/checkout` to v4.
- In CI, specify build target `@all`, and add `@lint`.
- List ppxs instead of `ppx_jane`.

## 0.0.4 (2024-02-14)

### Changed

- Upgrade dune to `3.14`.
- Build the doc with sherlodoc available to enable the doc search bar.

## 0.0.3 (2024-02-09)

### Added

- Setup `bisect_ppx` for test coverage.

### Changed

- Internal changes related to the release process.
- Upgrade dune.

## 0.0.2 (2024-01-18)

### Changed

- Internal changes related to build and release process.

## 0.0.1 (2023-11-07)

Initial release.

### Added

- Add `to_string`, which renders the contents of a `Pp.t` without trailing
  whitespaces.
