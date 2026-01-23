# Getting Started with Superpowers Workflow

This guide walks you through using the Superpowers development workflow to build features from idea to implementation.

## Overview

The Superpowers workflow is a spec-driven approach to development:

```
IDEATION → DESIGN → SPECIFICATION → PLANNING → IMPLEMENTATION → REVIEW → COMPLETION
```

Each stage produces documentation that guides the next stage.

## Quick Start

### 1. Check Your Status

```
/status
```

This shows where you are in the workflow and suggests next steps.

### 2. Start with Ideation

```
/brainstorm [your idea]
```

This invokes the brainstorming skill to explore your idea, ask clarifying questions, and produce a design document.

### 3. Write a Specification

```
/new-spec [feature-name]
```

This creates a spec document and guides you through defining:
- User stories
- Acceptance criteria
- Edge cases
- Technical approach

### 4. Create an Implementation Plan

```
/write-plan
```

This creates a detailed, task-by-task implementation plan from your spec.

### 5. Execute the Plan

```
/execute-plan
```

Choose between:
- **Subagent-driven**: Fresh agent per task, review between tasks
- **Batch execution**: Execute in batches with checkpoints

### 6. Review and Complete

```
/review
/finish
```

Request code review, then complete and merge your work.

## Key Commands

| Command | Purpose |
|---------|---------|
| `/status` | Show current workflow status |
| `/brainstorm` | Start ideation or design |
| `/new-spec [name]` | Create a specification |
| `/spec [id]` | Load a spec into context |
| `/schema [type]` | Load schemas into context |
| `/write-plan` | Create implementation plan |
| `/execute-plan` | Start implementation |
| `/review` | Request code review |
| `/finish` | Complete current work |

## Document Locations

| Type | Location | Purpose |
|------|----------|---------|
| Business docs | `docs/business/` | Vision, requirements, market |
| Specifications | `docs/specs/` | Feature requirements |
| Schemas | `docs/schemas/` | Data model, API, database |
| Designs | `docs/designs/` | Architecture decisions |
| Plans | `docs/plans/` | Implementation plans |
| Decisions | `docs/decisions/` | ADRs |

## Tips

1. **Start with specs** - Don't write code until you have an approved spec
2. **Use templates** - Every doc type has a `_template.md` file
3. **Keep docs updated** - Specs are living documents
4. **Commit often** - Each task in a plan should be one commit
