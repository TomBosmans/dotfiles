---
name: commits
description: create commit messages following this project's commit conventions.
---

## goal

create clear, well-structured commit messages following the project's commit conventions.

## Conventions

This project follows [Conventional Commits v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/).

### Format

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Types

- `feat` — a new feature
- `fix` — a bug fix
- `docs` — documentation only changes
- `style` — changes that do not affect the meaning of the code (whitespace, formatting, etc.)
- `refactor` — a code change that neither fixes a bug nor adds a feature
- `perf` — a code change that improves performance
- `test` — adding missing tests or correcting existing tests
- `build` — changes that affect the build system or external dependencies
- `ci` — changes to CI configuration files and scripts
- `chore` — other changes that don't modify src or test files

### Scopes

- `deps` — dependency changes
- `config` — install scripts
- each folder like: `zsh`, `nvim`, ... are each a scope.

Scopes are optional but encouraged when applicable. New scopes can be added as the project grows.

### Description

- Use the imperative, present tense: "add" not "added" nor "adds"
- Don't capitalize the first letter
- No period (.) at the end

### Body

Optional. Include a body when the description alone is not enough to understand the commit.

- Explain what the commit does and why, not how
- Use the imperative, present tense

### Footer

Optional. Use footers for issue references and breaking changes.

#### Issue references

- `Closes: #<number>` — to close an issue
- `Refs: #<number>` — to reference a related issue

Multiple references are allowed:

```
Closes: #42
Refs: #123, #456
```

#### Breaking changes

Use `BREAKING CHANGE:` in the footer followed by a description:

```
BREAKING CHANGE: card search endpoint now requires authentication
```

### Examples

#### Simple commit

```
chore: add devcontainer configuration
```

#### Commit with body

```
feat(api): add card search endpoint

Add endpoint to search cards by name, type, and mana cost.
Returns paginated results with default limit of 25.
```

#### Commit with footer

```
fix(ui): correct card image aspect ratio

Use object-fit contain instead of cover to prevent cropping
on non-standard card art dimensions.

Closes: #12
Refs: #8
```

#### Breaking change

```
refactor(api): restructure card response format

Flatten nested attributes into top-level fields to simplify
client-side parsing.

BREAKING CHANGE: card API responses no longer nest stats under a "attributes" key
Closes: #34
```

## workflow

1. run `git diff --cached` (or `git diff` if nothing is staged) to understand the changes.
2. read `#Conventions` for the commit message format, types, scopes, and rules.
3. formulate a commit message that follows the conventions.
4. if the changes span multiple scopes, consider whether they should be split into separate commits.
5. include a body only when the description alone is not sufficient.
6. add footer references to issues when applicable.
7. commit when the user asks.

## rules

- always analyze the actual code changes before writing a message.
- never guess, if the type or scope is unclear, ask the user.
- use only the types and scopes defined in `#Scopes`.
- if a new scope seems needed, suggest it to the user rather than inventing one silently.
