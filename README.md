# pp-extended

[![CI Status](https://github.com/mbarbin/pp-extended/workflows/ci/badge.svg)](https://github.com/mbarbin/pp-extended/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/github/mbarbin/pp-extended/badge.svg?branch=main)](https://coveralls.io/github/mbarbin/pp-extended?branch=main)

This library adds some functions to the [pp](https://opam.ocaml.org/packages/pp/) package.

## Usage

### Package usage

The intended usage is to refer to the module `Pp_extended` alongside `Pp` for the needed bits, and keep on simply using `Pp` as usual when no extended functionality is required.

### Vendor

Since the functions are so small, we suggest simply copying the code where needed. We are not lawyers, but we believe that retaining the SPDX license header with a link to this repository next to the copied code should be enough to satisfy the licensing requirements.

## Upstream?

After some experimentation, we might feel compelled to suggest integration upstream. Please open an issue if there's something you'd like to discuss.

## Code Documentation

The code documentation of the latest release is built with `odoc` and published to `GitHub` pages [here](https://mbarbin.github.io/pp-extended).
