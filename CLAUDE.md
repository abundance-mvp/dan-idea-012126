# Project: Superpowers Workflow System

## Overview

A spec-driven development workflow system for Claude Code that guides projects from idea to implementation with smart context management.

## Documentation

- Business context: docs/business/
- Specifications: docs/specs/
- Schemas: docs/schemas/
- Implementation plans: docs/plans/
- Architecture decisions: docs/decisions/
- Guides: docs/guides/

## Active Work

- Current stage: IMPLEMENTATION
- Active spec: None
- Active plan: docs/plans/2026-01-22-superpowers-workflow-implementation.md

## Workflow Commands

- /status - Show workflow status
- /brainstorm - Start ideation
- /new-spec [name] - Create specification
- /spec [id] - Load spec into context
- /schema [type] - Load schemas
- /write-plan - Create implementation plan
- /execute-plan - Start implementation
- /review - Request code review
- /finish - Complete current work

## Tech Stack

- Markdown for documentation and skills
- Bash for hooks
- YAML frontmatter for metadata

## Key Files

- `.claude/settings.json` - Hooks configuration
- `.claude/commands/` - Slash commands
- `.claude/hooks/` - Automation hooks
- `skills/` - Workflow skills

## Development Notes

- All document templates are in `docs/*/`
- Use templates when creating new documents
- Follow the workflow stages in order
- Commit after each task completion
