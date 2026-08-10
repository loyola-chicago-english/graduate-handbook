# Overview

This repository holds the source of the handbook for graduate students in the [Department of English at Loyola University Chicago](https://www.luc.edu/english/), which is released as a PDF.

## Where the text lives

The principal source file is `handbook.md`.
Appendices are separate files in `appendices/`, pulled in at build time by the Lua filter `include-files.lua`.
The timeline table is maintained as a CSV file in `appendices/` and converted to Markdown by the build.
`config/default.yaml` holds the Pandoc settings, and `images/` holds the one image.

## Editing the text

Write one sentence per line, so that a reworded sentence shows as a one-line change.

Keep the source ASCII.
Write `--` for an en dash and `---` for an em dash; Pandoc renders them.
Set terminal commas and periods inside the closing quotation mark, per the American convention; colons stay outside.
Use numerals for credit hours and page lengths, and otherwise spell out whole numbers through one hundred (CMOS18, 9.2).

Prefer linking the [Academic Catalog](https://catalog.luc.edu/) to restating it.
The catalog is authoritative, and this handbook says so in its first section.

## Building

`build.sh` is the build.
The GitHub Action installs the dependencies and then calls it, so a local run and a released PDF come from the same source.
Run it from the root of the repository.

It needs Pandoc, LuaLaTeX from TeX Live 2025 or later (required by the PDF/UA-2 tagging the build requests), and `include-files.lua`, resolved from either the working directory or Pandoc's user data directory.
For the versions the release is built against, see `.github/workflows/`.

## Releasing

Pushing to `main` builds the PDF.
Pushing a tag of the form `v2027.0` also attaches it to a GitHub release.
For versioning logic and a changelog see CHANGELOG.md.

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

A scope names the part of the handbook affected, e.g. `ma`, `phd`, `personnel`, `catalog`, `funding`, `changelog`, or `handbook` (alternatively, `text`) for the document as a whole.

Make one logical change per commit.
Entries in CHANGELOG.md cite the commit that made the change, so a commit mixing several reader-facing changes cannot be cited precisely.
The changelog covers the text only: commits typed `build`, `ci`, `chore`, and `docs` do not appear in it.
