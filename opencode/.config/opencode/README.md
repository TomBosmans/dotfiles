# OpenCode Configuration

Personal configuration for [OpenCode](https://opencode.ai), including custom agents, skills, and MCP server integrations.

## Dependencies

### GitLab
Uses the built-in `glab mcp serve` command. Requires `glab` to be installed and authenticated:
```sh
brew install glab
glab auth login
```

### GitHub
Uses the official [github-mcp-server](https://github.com/github/github-mcp-server). Install it and ensure `gh` is authenticated:

```sh
brew install gh
brew install github-mcp-server
gh auth login

```
The config automatically pulls the token from `gh auth` at startup.
## Setup

1. Install system dependencies (see above).
2. Open a project directory and run `opencode`.

## Structure

```
agents/       Custom agent definitions (coder, docs, explore, review, security)
skills/       Skill definitions (git-commit, review)
opencode.json MCP server configuration
```
