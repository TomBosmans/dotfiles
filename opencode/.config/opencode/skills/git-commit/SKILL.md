---
name: git-commit
description: Create semantic git commit messages based on the Conventional Commits specification.
license: MIT
---

## Goal
Create clear, semantic git commit messages based on the current changes using the Conventional Commits v1.0.0 specification.

## Specification (Conventional Commits v1.0.0)

The commit message must be structured as follows:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### 1. Type
Must be one of the following:
*   `feat`: A new feature
*   `fix`: A bug fix
*   `build`: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
*   `chore`: Other changes that don't modify src or test files
*   `ci`: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
*   `docs`: Documentation only changes
*   `style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
*   `refactor`: A code change that neither fixes a bug nor adds a feature
*   `perf`: A code change that improves performance
*   `test`: Adding missing tests or correcting existing tests

### 2. Scope
Optional. A noun describing a section of the codebase surrounded by parentheses, e.g., `feat(parser): add ability to parse arrays`.

### 3. Description
A short summary of the code changes.
*   Use the imperative, present tense: "change" not "changed" nor "changes".
*   Don't capitalize the first letter.
*   No dot (.) at the end.

### 4. Body
Optional. Use if the description is not enough.
*   Use the imperative, present tense.
*   Explain the *what* and *why*, not the *how*.

### 5. Footer
Optional.
*   **BREAKING CHANGE:** Start with `BREAKING CHANGE: ` followed by a space or two newlines. The rest of the commit message is then used for this.
*   Referencing issues: `Refs: #123` or `Closes: #123`.

## Workflow
1.  **Analyze**: Run `git status` and `git diff --cached` (or `git diff` if not staged yet) to understand the changes.
2.  **Formulate**: Create a commit message that strictly follows the convention above.
3.  **Commit**: If the user asks to commit, use `git commit -m "..."`. If the message has a body, use multiple `-m` flags or a heredoc if complex.

## Rules
*   Never generate a commit message that violates the structure.
*   If unsure about the "type", err on the side of `chore` or ask the user.
*   Always look at the actual code changes to determine the message, don't just guess.
