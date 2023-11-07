# pp-extended

[![CI Status](https://github.com/mbarbin/pp-extended/workflows/ci/badge.svg)](https://github.com/mbarbin/pp-extended/actions/workflows/ci.yml)
[![Deploy odoc Status](https://github.com/mbarbin/pp-extended/workflows/deploy-odoc/badge.svg)](https://github.com/mbarbin/pp-extended/actions/workflows/deploy-odoc.yml)

This library adds a few functions to the
[pp](https://opam.ocaml.org/packages/pp/) package to be used by projects
using [base](https://opam.ocaml.org/packages/base/).

## Usage

The intended usage is to refer to the module `Pp_extended` alongside `Pp`
for the needed bits, and keep on simply using `Pp` as usual when no extended
functionality is required.

## Code documentation

The tip of the default branch is compiled with odoc and published to
GitHub pages [here](https://mbarbin.github.io/pp-extended/).
