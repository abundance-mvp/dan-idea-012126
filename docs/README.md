# Documentation

This directory contains all project documentation organized by type.

## Structure

| Directory | Purpose | Naming Convention |
|-----------|---------|-------------------|
| `business/` | Product vision, market analysis, requirements | Descriptive names |
| `specs/` | Feature specifications | `SPEC-NNN-kebab-name.md` |
| `schemas/` | Data models, API contracts, database schemas | Descriptive names |
| `designs/` | Architecture and design documents | `YYYY-MM-DD-topic-design.md` |
| `plans/` | Implementation plans | `YYYY-MM-DD-feature-plan.md` |
| `decisions/` | Architecture Decision Records | `ADR-NNN-short-title.md` |
| `guides/` | How-to documentation | Descriptive names |

## Document Flow

```
business/ (why) → specs/ (what) → schemas/ (shape) → designs/ (how) → plans/ (steps)
```

## Quick Start

1. Run `/new-project` to scaffold a new project with this structure
2. Run `/brainstorm` to start ideation
3. Run `/status` to see current workflow state

## Index

### Business
- [vision.md](business/vision.md) - Product vision and target market

### Specs
- *No specs yet. Run `/new-spec [name]` to create one.*

### Schemas
- *No schemas yet. Create from templates in `schemas/`.*

### Designs
- [2026-01-22-superpowers-workflow-system-design.md](plans/2026-01-22-superpowers-workflow-system-design.md)

### Guides
- [getting-started.md](guides/getting-started.md) - How to use this workflow
- [workflow-guide.md](guides/workflow-guide.md) - Complete workflow reference
- [contributing.md](guides/contributing.md) - How to contribute
