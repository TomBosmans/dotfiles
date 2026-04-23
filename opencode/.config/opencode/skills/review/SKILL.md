---
name: review
description: Review code changes since the branch diverged from the main branch.
license: MIT
---

## Goal
Perform a comprehensive code review of all changes introduced in the current branch, focusing on correctness, maintainability, security, and adherence to project conventions.

## Workflow

1.  **Identify Base Branch**:
    *   Determine the default branch (usually `main`, `master`, or `develop`).
    *   If unsure, check remote refs (`git branch -r`) or ask the user.

2.  **Gather Context**:
    *   Run `git log --oneline --graph --decorate --all -n 10` to visualize the branch structure.
    *   Run `git diff --name-only <base-branch>...HEAD` to see the list of changed files.
    *   Run `git diff <base-branch>...HEAD` to see the actual code changes.

3.  **Review Criteria**:
    *   **Correctness**: Does the code do what it's supposed to? Are there edge cases?
    *   **Security**: Are there any vulnerabilities (e.g., injection, secrets, unvalidated input)?
    *   **Performance**: Are there inefficient algorithms or unnecessary resource usage?
    *   **Readability**: Is the code clear, well-named, and easy to understand?
    *   **Conventions**: Does it follow the project's style guide and patterns?
    *   **Testing**: Are there tests? Do they cover the changes?

4.  **Output**:
    *   Provide a summary of the changes.
    *   List specific issues found, grouped by file or category.
    *   Prioritize issues (Critical, Major, Minor).
    *   Suggest concrete improvements or code snippets.

## Rules
*   Be constructive and polite.
*   Focus on the code, not the author.
*   If a change is good, acknowledge it.
*   Verify assumptions about external libraries or APIs.
