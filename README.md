# jstats-tests

Regression scripts, data generators and small synthetic datasets for the
[jstats](https://github.com/jma61/jstats) R package.

- `regression/` -- the test scripts. `*_check.R` files are assertion
  batteries (each ends on a PASS/FAIL verdict; `run_all.R` runs them all).
  `*_walk.R` files are walkthroughs whose output is read by a person against
  the "Expected" comments beside each call; `walk_tools.R` runs them a
  section at a time. Files beginning with `_` are templates.
- `generators/` -- seeded scripts that build every file in `datasets/`.
- `datasets/` -- the generated data files. All of the data are synthetic.

The scripts are run with the development version of jstats loaded
(`devtools::load_all()`), and read their data from fixed paths on the
maintainer's computer, set in a constants block at the top of each file.
They are published as the working record of how the package is tested,
not as a general-purpose test suite.
