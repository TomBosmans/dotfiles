---
description: Create a git commit
subtask: true
---

Create a commit from the current changes.

## Steps

1. Run `git status` and `git diff` (staged and unstaged) to understand what changed.
2. If nothing is staged, stage all changes. Never stage files that look like secrets (.env, credentials, tokens, private keys).
3. Follow conventional commits conventions unless the project describes another convention.
4. Write a concise commit message:
   - If arguments are provided below, use them as context for the "why" of the commit.
   - If arguments contain an issue reference (e.g., #123, PROJ-456), fetch the issue details and use them to inform the message. Add a `Refs:` footer.
   - If no arguments are provided, describe what changed concisely.
   - Use sensible scopes based on the project or the files changed.
5. Create the commit and confirm success.

$ARGUMENTS
