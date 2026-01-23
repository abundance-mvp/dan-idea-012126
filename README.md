# Superpowers Skills Library

A spec-driven development workflow system for Claude Code with 18 skills, smart context management, and automated workflow guidance.

## Features

- **Spec-Driven Development**: Every feature starts with a specification
- **Smart Context Loading**: Hooks automatically load relevant docs based on your prompts
- **Workflow Guidance**: Skills guide you through each development stage
- **Document Templates**: Ready-to-use templates for specs, designs, plans, and more

## Quick Start

```bash
# Check current status
/status

# Start brainstorming an idea
/brainstorm [your idea]

# Create a specification
/new-spec [feature-name]

# Create implementation plan
/write-plan

# Execute the plan
/execute-plan
```

## Workflow Stages

```
IDEATION → DESIGN → SPECIFICATION → PLANNING → IMPLEMENTATION → REVIEW → COMPLETION
```

See [docs/guides/workflow-guide.md](docs/guides/workflow-guide.md) for complete documentation.

## Skills

### Workflow Skills (New)
| Skill | Description |
|-------|-------------|
| workflow-navigator | Shows status, suggests next steps |
| writing-specs | Guide spec creation |
| writing-schemas | Guide schema creation |
| project-scaffolding | Initialize new projects |

### Core Skills (from Superpowers)
| Skill | Description |
|-------|-------------|
| brainstorming | Ideation and design |
| writing-plans | Create implementation plans |
| executing-plans | Execute plans with checkpoints |
| subagent-driven-development | Execute with fresh subagents |
| test-driven-development | TDD discipline |
| systematic-debugging | Methodical debugging |
| requesting-code-review | Request reviews |
| receiving-code-review | Handle feedback |
| finishing-a-development-branch | Complete work |
| verification-before-completion | Verify before claiming done |
| dispatching-parallel-agents | Coordinate parallel work |
| using-git-worktrees | Isolated workspaces |
| using-superpowers | Introduction to skills |

## Commands

| Command | Purpose |
|---------|---------|
| `/status` | Show workflow status |
| `/brainstorm` | Start ideation |
| `/new-spec [name]` | Create specification |
| `/spec [id]` | Load spec into context |
| `/schema [type]` | Load schemas |
| `/new-project` | Scaffold new project |

## Documentation

- [Getting Started](docs/guides/getting-started.md)
- [Workflow Guide](docs/guides/workflow-guide.md)
- [Contributing](docs/guides/contributing.md)

## Installation

This repository can be used as a Claude Code plugin:

1. Clone this repository
2. Install as a local plugin in Claude Code

## License

MIT
