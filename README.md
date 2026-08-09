# Overview

This repository holds the source files and build scripts for the handbook for graduate students in the [Department of English at Loyola University Chicago](https://www.luc.edu/english/).
Build and deployment is done with GitHub Actions.
The shell script `build.sh` provides an equivalent build for local testing.
For dependencies see the GitHub Action.

The principal source file is `handbook.md`.
The released PDF is built with [Pandoc](https://pandoc.org/), the behavior of which is controlled by `config/default.yaml`.
Appendices are maintained as separate files in the directory `appendices/` and included with the Lua filter `include-files.lua`.
The CSV file in `appendices/` is converted to a Markdown table prior to other build operations.
The directory `images/` stores an image file.

For versioning logic and a changelog see the file CHANGELOG.md.

# Commit Conventions

Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/), in the form `type(scope): description`.

The product of this repository is the handbook, and its readers are students and faculty.
The prose in `handbook.md` and `appendices/` is therefore source, not documentation.
A commit type describes what a change does for a reader of the handbook; only `docs` refers to documentation of the repository itself.

| Type | Use for | Changelog section |
| --- | --- | --- |
| `feat` | a new policy, section, or provision | Added |
| `fix` | correcting what is wrong, stale, or broken | Fixed |
| `refactor` | rewording or reorganizing, meaning unchanged | Changed, or nothing |
| `style` | whitespace, Markdown formatting, typography | nothing |
| `build` | `build.sh`, `config/default.yaml`, Pandoc settings | nothing |
| `ci` | the GitHub Action | nothing |
| `chore` | version bumps, changelog upkeep, repository housekeeping | nothing |
| `docs` | `README.md`, `LICENSE`: the repository, not the handbook | nothing |

The specification defines only `feat` and `fix`; the remaining types are local convention and may be revised.
There is no type for removal.
Use `fix` where something is removed as wrong or outdated, and `refactor` where it is removed because it has moved or been superseded; either way the change is recorded under "Removed" in the changelog.

A scope names the part of the handbook affected, e.g. `ma`, `phd`, `personnel`, `catalog`, `funding`, `changelog`, or `handbook` for the document as a whole.

Make one logical change per commit.
Entries in CHANGELOG.md cite the commit that made the change, so a commit mixing several reader-facing changes cannot be cited precisely.
The changelog covers the text only: commits typed `build`, `ci`, `chore`, and `docs` do not appear in it.
