---
name: project-scaffolding
description: "Initialize a new project with the complete Superpowers workflow structure including docs, skills, commands, and hooks. Use when starting a new project from scratch."
---

# Project Scaffolding

## Overview

Create a complete project structure with all documentation templates, workflow skills, commands, and hooks.

**Announce at start:** "I'm using the project-scaffolding skill to initialize your project."

## What Gets Created

```
project-root/
├── .claude/
│   ├── settings.json          # Hooks configuration
│   ├── commands/              # Slash commands
│   │   ├── new-spec.md
│   │   ├── spec.md
│   │   ├── schema.md
│   │   └── status.md
│   └── hooks/
│       ├── context-loader.sh
│       ├── spec-gate.sh
│       └── update-status.sh
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── skills/                    # Copy all workflow skills
├── docs/
│   ├── README.md
│   ├── business/
│   │   ├── _template.md
│   │   └── vision.md
│   ├── specs/
│   │   └── _template.md
│   ├── schemas/
│   │   ├── _template-data-model.md
│   │   ├── _template-api-schema.md
│   │   └── _template-database.md
│   ├── designs/
│   │   └── _template.md
│   ├── plans/
│   │   └── _template.md
│   ├── decisions/
│   │   └── _template-adr.md
│   └── guides/
│       ├── getting-started.md
│       ├── workflow-guide.md
│       └── contributing.md
├── CLAUDE.md
├── README.md
└── .gitignore
```

## The Process

1. **Ask project name** - Get the project name for CLAUDE.md and README
2. **Create directory structure** - All folders and templates
3. **Copy skills** - All workflow skills
4. **Create hooks** - All automation hooks
5. **Create commands** - All slash commands
6. **Initialize git** - If not already a repo
7. **Initial commit** - Commit the scaffold

## CLAUDE.md Template

```markdown
# Project: [PROJECT_NAME]

## Overview

[Project description - fill this in]

## Documentation

- Business context: docs/business/
- Specifications: docs/specs/
- Schemas: docs/schemas/
- Implementation plans: docs/plans/

## Active Work

- Current stage: IDEATION
- Active spec: None
- Active plan: None

## Workflow Commands

- /status - Show workflow status
- /brainstorm - Start ideation
- /new-spec [name] - Create specification
- /write-plan - Create implementation plan
- /execute-plan - Start implementation
- /review - Request code review
- /finish - Complete current work

## Tech Stack

[Fill in your tech stack]

## Development

[Fill in development setup instructions]
```

## Post-Scaffold

After scaffolding, suggest:
1. Fill in CLAUDE.md overview
2. Run /brainstorm to start ideation
3. Fill in docs/business/vision.md
