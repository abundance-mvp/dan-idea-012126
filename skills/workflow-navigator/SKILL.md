---
name: workflow-navigator
description: "Shows current workflow status, suggests next steps, and helps load relevant context. Use when user asks about project status or what to do next."
---

# Workflow Navigator

## Overview

Help users understand where they are in the development workflow and what to do next.

## When Invoked

Show the current workflow status by reading CLAUDE.md and docs/README.md, then suggest appropriate next actions.

## Status Display Format

```
Workflow Status
==================

Current Stage: [IDEATION | DESIGN | SPECIFICATION | PLANNING | IMPLEMENTATION | REVIEW | COMPLETION]

Active Documents:
- Spec: [SPEC-NNN-name or "None"]
- Plan: [plan-name or "None"]
- Design: [design-name or "None"]

Progress: [If in implementation, show task progress]

Suggested Next Steps:
1. [Most relevant action based on current state]
2. [Alternative action]

Quick Commands:
- /brainstorm - Start ideation or design
- /new-spec [name] - Create a new spec
- /write-plan - Create implementation plan
- /execute-plan - Start implementation
- /review - Request code review
- /finish - Complete current work
```

## Stage Detection Logic

1. Check CLAUDE.md for "Active Work" section
2. Check docs/specs/ for in-progress specs
3. Check docs/plans/ for recent plans
4. Check git status for uncommitted work

## Context Loading

When user asks about a specific area, load relevant documents:
- "What's the API?" -> Load docs/schemas/api-schema.md
- "Show me the data model" -> Load docs/schemas/data-model.md
- "What are we building?" -> Load active spec or docs/business/vision.md
