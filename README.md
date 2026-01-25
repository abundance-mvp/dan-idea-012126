# Soul

A project built with the Superpowers workflow system for spec-driven development.

## Getting Started

1. Run `/status` to see workflow status
2. Run `/brainstorm` to start ideation
3. Fill in `docs/business/vision.md` with your vision

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

## Documentation

| Directory | Purpose |
|-----------|---------|
| `docs/business/` | Business context and vision |
| `docs/specs/` | Feature specifications |
| `docs/schemas/` | Data models and API schemas |
| `docs/plans/` | Implementation plans |
| `docs/decisions/` | Architecture Decision Records |
| `docs/guides/` | How-to guides |

## Commands

| Command | Purpose |
|---------|---------|
| `/status` | Show workflow status |
| `/brainstorm` | Start ideation |
| `/new-spec [name]` | Create specification |
| `/spec [id]` | Load spec into context |
| `/schema [type]` | Load schemas |
| `/write-plan` | Create implementation plan |
| `/execute-plan` | Start implementation |
| `/review` | Request code review |
| `/finish` | Complete current work |

## License

[Add your license here]
