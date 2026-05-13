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

### Chrome DevTools
Uses [chrome-devtools-mcp](https://github.com/anthropics/anthropic-quickstarts/tree/main/chrome-devtools-mcp):
```sh
brew install chrome-devtools-mcp
```

### Atlassian (Jira/Confluence)
Remote MCP at `https://mcp.atlassian.com/v1/mcp`. No local install required (authenticates via OAuth).

### Mermaid
Remote MCP at `https://mcp.mermaid.ai/mcp`. No local install required.

## Setup

1. Install system dependencies (see above).
2. Open a project directory and run `opencode`.

## Structure

```
agents/                          Custom agent definitions
commands/                        Slash commands
  commit.md                      Create a git commit following conventional commits
skills/                          Skill definitions
  conventional-commits/SKILL.md  Conventional Commits v1.0 spec
  semver/SKILL.md                Semantic Versioning 2.0.0 spec
opencode.json                    MCP server configuration
```
