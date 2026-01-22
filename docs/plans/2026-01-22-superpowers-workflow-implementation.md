# Superpowers Workflow System Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement the complete workflow system with 4 new skills, 5 commands, 3 hooks, and all supporting templates and documentation.

**Architecture:** Build in layers - templates first (foundation), then skills (logic), then commands (interface), then hooks (automation), finally guides (documentation).

**Tech Stack:** Markdown (skills/commands), Bash (hooks), YAML frontmatter (templates)

---

## Task 1: Create Documentation Index

**Files:**
- Modify: `docs/README.md`

**Step 1: Read existing file**

```bash
cat docs/README.md
```

**Step 2: Write updated documentation index**

```markdown
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
```

**Step 3: Commit**

```bash
git add docs/README.md
git commit -m "docs: update documentation index with workflow structure"
```

---

## Task 2: Create Document Templates - Business

**Files:**
- Create: `docs/business/_template.md`
- Create: `docs/business/vision.md`

**Step 1: Create business template**

```markdown
---
title: [Document Title]
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: draft | review | approved
---

# [Document Title]

## Overview

[Brief description of what this document covers]

## Content

[Main content goes here]

## Related Documents

- [Link to related docs]

## Revision History

| Date | Author | Changes |
|------|--------|---------|
| YYYY-MM-DD | [Name] | Initial draft |
```

**Step 2: Create vision placeholder**

```markdown
---
title: Product Vision
created: 2026-01-22
updated: 2026-01-22
status: draft
---

# Product Vision

## Overview

[Describe the product vision, mission, and value proposition]

## Target Market

[Who is this for? What problem does it solve?]

## Success Metrics

[How will we measure success?]

## Related Documents

- docs/business/requirements.md
- docs/business/market-analysis.md
```

**Step 3: Commit**

```bash
git add docs/business/
git commit -m "docs: add business document templates"
```

---

## Task 3: Create Document Templates - Specs

**Files:**
- Create: `docs/specs/_template.md`

**Step 1: Create spec template**

```markdown
---
id: SPEC-NNN
title: [Feature Name]
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: draft | review | approved | in-progress | complete
author: [Name]
relates-to:
  - docs/schemas/data-model.md
  - docs/designs/YYYY-MM-DD-design.md
---

# SPEC-NNN: [Feature Name]

## Summary

[One paragraph describing what this feature does and why it matters]

## Goals

- [ ] Goal 1
- [ ] Goal 2

## Non-Goals

- What this feature explicitly does NOT do

## User Stories

### Story 1: [User Role] wants to [action]

**As a** [user role]
**I want to** [action]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] Criterion 1
- [ ] Criterion 2

## Technical Approach

[High-level technical approach - link to design doc for details]

## Edge Cases

| Scenario | Expected Behavior |
|----------|-------------------|
| [Edge case 1] | [What should happen] |

## Security Considerations

- [Any security implications]

## Testing Strategy

- Unit tests: [What to test]
- Integration tests: [What to test]
- E2E tests: [What to test]

## Rollout Plan

- [ ] Phase 1: [Description]
- [ ] Phase 2: [Description]

## Open Questions

- [ ] Question 1?
```

**Step 2: Commit**

```bash
git add docs/specs/
git commit -m "docs: add spec template"
```

---

## Task 4: Create Document Templates - Schemas

**Files:**
- Create: `docs/schemas/_template-data-model.md`
- Create: `docs/schemas/_template-api-schema.md`
- Create: `docs/schemas/_template-database.md`

**Step 1: Create data model template**

```markdown
---
title: Data Model
created: YYYY-MM-DD
updated: YYYY-MM-DD
version: 1.0.0
---

# Data Model

## Overview

[Description of the domain model]

## Entities

### EntityName

[Description of entity]

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| id | UUID | Yes | Unique identifier |
| createdAt | DateTime | Yes | Creation timestamp |
| updatedAt | DateTime | Yes | Last update timestamp |

**Relationships:**
- Has many: [Related entities]
- Belongs to: [Parent entity]

**Invariants:**
- [Business rules that must always be true]

## Entity Diagram

```
[Entity1] 1--* [Entity2]
[Entity2] *--1 [Entity3]
```

## Revision History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | YYYY-MM-DD | Initial model |
```

**Step 2: Create API schema template**

```markdown
---
title: API Schema
created: YYYY-MM-DD
updated: YYYY-MM-DD
version: 1.0.0
base_url: /api/v1
---

# API Schema

## Overview

[Description of the API]

## Authentication

[How authentication works]

## Endpoints

### Resource: [ResourceName]

#### GET /resource

**Description:** [What it does]

**Request:**
- Headers: `Authorization: Bearer <token>`
- Query params:
  - `limit` (optional): Number of items (default: 20)
  - `offset` (optional): Pagination offset

**Response:**
```json
{
  "data": [],
  "meta": {
    "total": 0,
    "limit": 20,
    "offset": 0
  }
}
```

**Errors:**
| Code | Description |
|------|-------------|
| 401 | Unauthorized |
| 404 | Not found |

#### POST /resource

**Description:** [What it does]

**Request:**
```json
{
  "field": "value"
}
```

**Response:** `201 Created`
```json
{
  "id": "uuid",
  "field": "value"
}
```

## Error Format

All errors follow this format:
```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable message"
  }
}
```
```

**Step 3: Create database schema template**

```markdown
---
title: Database Schema
created: YYYY-MM-DD
updated: YYYY-MM-DD
version: 1.0.0
database: PostgreSQL
---

# Database Schema

## Overview

[Description of the database design]

## Tables

### table_name

[Description]

```sql
CREATE TABLE table_name (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  -- Add fields here
);

-- Indexes
CREATE INDEX idx_table_name_field ON table_name(field);

-- Triggers
CREATE TRIGGER update_table_name_updated_at
  BEFORE UPDATE ON table_name
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
```

## Migrations

| Version | Description | Date |
|---------|-------------|------|
| 001 | Initial schema | YYYY-MM-DD |

## Indexes Strategy

[Explain indexing decisions]

## Partitioning

[If applicable, explain partitioning strategy]
```

**Step 4: Commit**

```bash
git add docs/schemas/
git commit -m "docs: add schema templates (data model, API, database)"
```

---

## Task 5: Create Document Templates - Designs, Plans, ADRs

**Files:**
- Create: `docs/designs/_template.md`
- Create: `docs/plans/_template.md`
- Create: `docs/decisions/_template-adr.md`
- Create: `docs/decisions/` directory

**Step 1: Create design template**

```markdown
---
title: [Feature] Design
created: YYYY-MM-DD
author: [Name]
status: draft | review | approved
relates-to:
  - docs/specs/SPEC-NNN.md
---

# [Feature] Design

## Overview

[Brief description of what this design covers]

## Goals

- Goal 1
- Goal 2

## Architecture

[High-level architecture description]

### Components

| Component | Responsibility |
|-----------|---------------|
| [Name] | [What it does] |

### Data Flow

```
[Component A] → [Component B] → [Component C]
```

## Technical Decisions

### Decision 1: [Topic]

**Options considered:**
1. Option A - [pros/cons]
2. Option B - [pros/cons]

**Decision:** Option X because [reasoning]

## Error Handling

[How errors are handled]

## Testing Strategy

[How this will be tested]

## Open Questions

- [ ] Question 1?
```

**Step 2: Create plan template**

```markdown
---
title: [Feature] Implementation Plan
created: YYYY-MM-DD
design: docs/designs/YYYY-MM-DD-feature-design.md
spec: docs/specs/SPEC-NNN.md
status: draft | in-progress | complete
---

# [Feature] Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** [One sentence describing what this builds]

**Architecture:** [2-3 sentences about approach]

**Tech Stack:** [Key technologies/libraries]

---

## Task 1: [Task Name]

**Files:**
- Create: `path/to/file`
- Modify: `path/to/existing`
- Test: `tests/path/to/test`

**Step 1: [Action]**

[Details]

**Step 2: [Action]**

[Details]

**Step 3: Commit**

```bash
git add [files]
git commit -m "feat: [description]"
```

---

## Task 2: [Task Name]

[Continue pattern...]
```

**Step 3: Create ADR template**

```markdown
---
id: ADR-NNN
title: [Short Title]
created: YYYY-MM-DD
status: proposed | accepted | deprecated | superseded
superseded_by: ADR-NNN (if applicable)
---

# ADR-NNN: [Short Title]

## Status

[Proposed | Accepted | Deprecated | Superseded by ADR-NNN]

## Context

[What is the issue that we're seeing that motivates this decision?]

## Decision

[What is the change that we're proposing and/or doing?]

## Consequences

### Positive

- [Good outcome 1]
- [Good outcome 2]

### Negative

- [Bad outcome 1]
- [Bad outcome 2]

### Neutral

- [Neutral outcome]

## Alternatives Considered

### Alternative 1: [Name]

[Description and why it was rejected]

### Alternative 2: [Name]

[Description and why it was rejected]
```

**Step 4: Commit**

```bash
git add docs/designs/ docs/plans/_template.md docs/decisions/
git commit -m "docs: add design, plan, and ADR templates"
```

---

## Task 6: Create Skill - workflow-navigator

**Files:**
- Create: `skills/workflow-navigator/SKILL.md`

**Step 1: Create skill file**

```markdown
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
📍 Workflow Status
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
- "What's the API?" → Load docs/schemas/api-schema.md
- "Show me the data model" → Load docs/schemas/data-model.md
- "What are we building?" → Load active spec or docs/business/vision.md
```

**Step 2: Commit**

```bash
git add skills/workflow-navigator/
git commit -m "feat: add workflow-navigator skill"
```

---

## Task 7: Create Skill - writing-specs

**Files:**
- Create: `skills/writing-specs/SKILL.md`
- Create: `skills/writing-specs/spec-checklist.md`

**Step 1: Create main skill file**

```markdown
---
name: writing-specs
description: "Guide spec document creation with structured templates, acceptance criteria patterns, and edge case identification. Use when creating or refining feature specifications."
---

# Writing Specifications

## Overview

Help create comprehensive, well-structured feature specifications that serve as the source of truth for implementation.

**Announce at start:** "I'm using the writing-specs skill to create this specification."

## The Process

1. **Understand the feature** - Ask clarifying questions one at a time
2. **Draft the spec** - Use the template from `docs/specs/_template.md`
3. **Identify edge cases** - Systematically explore boundary conditions
4. **Define acceptance criteria** - Clear, testable criteria for each user story
5. **Review and refine** - Walk through with user section by section

## Key Sections

### User Stories Format

```markdown
### Story: [User Role] wants to [action]

**As a** [specific user role]
**I want to** [specific action]
**So that** [specific benefit]

**Acceptance Criteria:**
- [ ] Given [context], when [action], then [outcome]
- [ ] Given [context], when [action], then [outcome]
```

### Edge Cases Checklist

See `./spec-checklist.md` for comprehensive edge case patterns.

### Acceptance Criteria Patterns

**Good criteria are:**
- Testable (can write a test for it)
- Specific (no ambiguity)
- Independent (don't depend on other criteria)
- Valuable (tied to user value)

**Example:**
- ❌ "System should be fast" (not testable)
- ✅ "API response time < 200ms for 95th percentile" (testable)

## After Writing

1. Save to `docs/specs/SPEC-NNN-feature-name.md`
2. Update `docs/README.md` index
3. Set status to "review"
4. Commit the spec

## Related Skills

- `superpowers:brainstorming` - Use first for ideation
- `superpowers:writing-plans` - Use after spec is approved
```

**Step 2: Create spec checklist**

```markdown
# Spec Edge Case Checklist

## Input Validation
- [ ] Empty input
- [ ] Null/undefined input
- [ ] Maximum length input
- [ ] Minimum length input
- [ ] Special characters
- [ ] Unicode/emoji
- [ ] SQL injection attempts
- [ ] XSS attempts

## Authentication/Authorization
- [ ] Unauthenticated user
- [ ] Expired token
- [ ] Insufficient permissions
- [ ] Admin vs regular user
- [ ] Rate limiting

## Data States
- [ ] Empty state (no data)
- [ ] Single item
- [ ] Many items (pagination)
- [ ] Maximum items
- [ ] Deleted/archived items
- [ ] Draft vs published

## Timing/Concurrency
- [ ] Simultaneous requests
- [ ] Race conditions
- [ ] Timeout scenarios
- [ ] Retry behavior

## Error Scenarios
- [ ] Network failure
- [ ] Database unavailable
- [ ] Third-party API failure
- [ ] Partial failure (some succeed, some fail)

## Business Rules
- [ ] Boundary values
- [ ] State transitions
- [ ] Cascading effects
```

**Step 3: Commit**

```bash
git add skills/writing-specs/
git commit -m "feat: add writing-specs skill"
```

---

## Task 8: Create Skill - writing-schemas

**Files:**
- Create: `skills/writing-schemas/SKILL.md`

**Step 1: Create skill file**

```markdown
---
name: writing-schemas
description: "Guide data model, API schema, and database schema creation with best practices. Use when designing technical contracts and data structures."
---

# Writing Schemas

## Overview

Help create well-designed technical schemas that serve as contracts between system components.

**Announce at start:** "I'm using the writing-schemas skill to design this schema."

## Schema Types

### Data Model (docs/schemas/data-model.md)
- Domain entities and relationships
- Business invariants
- Field types and constraints

### API Schema (docs/schemas/api-schema.md)
- Endpoints and methods
- Request/response formats
- Error codes and messages
- Authentication requirements

### Database Schema (docs/schemas/database-schema.md)
- Table definitions
- Indexes and constraints
- Migration strategy

## The Process

1. **Identify entities** - What are the core domain objects?
2. **Define relationships** - How do entities relate to each other?
3. **Specify fields** - What data does each entity hold?
4. **Add constraints** - What rules must be enforced?
5. **Design for change** - How might this evolve?

## Best Practices

### Data Model
- Use UUIDs for primary keys (not auto-increment)
- Always include created_at, updated_at timestamps
- Define invariants explicitly
- Document relationships clearly

### API Design
- Use RESTful conventions
- Version your API (/api/v1/)
- Consistent error format
- Pagination for lists
- HATEOAS links where appropriate

### Database
- Index foreign keys
- Use appropriate column types
- Plan for migrations
- Consider soft deletes

## Anti-Patterns to Avoid

- God entities (too many fields)
- Missing constraints
- Stringly-typed data
- Implicit relationships
- Missing indexes on query patterns

## Output

Save schemas to appropriate files in `docs/schemas/`:
- `data-model.md`
- `api-schema.md`
- `database-schema.md`
```

**Step 2: Commit**

```bash
git add skills/writing-schemas/
git commit -m "feat: add writing-schemas skill"
```

---

## Task 9: Create Skill - project-scaffolding

**Files:**
- Create: `skills/project-scaffolding/SKILL.md`

**Step 1: Create skill file**

```markdown
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
```

**Step 2: Commit**

```bash
git add skills/project-scaffolding/
git commit -m "feat: add project-scaffolding skill"
```

---

## Task 10: Create Command - /status

**Files:**
- Create: `.claude/commands/status.md`

**Step 1: Create commands directory and status command**

```markdown
---
name: status
description: Show current workflow status and suggest next steps
---

Invoke the `workflow-navigator` skill to display current project status.

Show:
1. Current workflow stage
2. Active documents (spec, plan, design)
3. Implementation progress if applicable
4. Suggested next steps
5. Available commands

Read CLAUDE.md and docs/README.md to determine current state.
```

**Step 2: Commit**

```bash
git add .claude/commands/status.md
git commit -m "feat: add /status command"
```

---

## Task 11: Create Command - /new-spec

**Files:**
- Create: `.claude/commands/new-spec.md`

**Step 1: Create command**

```markdown
---
name: new-spec
description: Create a new specification document from template
args: name - The name of the feature to specify
---

Create a new specification document:

1. Determine next SPEC number by checking docs/specs/ for existing specs
2. Create `docs/specs/SPEC-NNN-{name}.md` from `docs/specs/_template.md`
3. Replace placeholders with provided name and today's date
4. Invoke the `writing-specs` skill to guide spec creation
5. After completion, update docs/README.md index
6. Commit the new spec

If no name provided, ask for one.
```

**Step 2: Commit**

```bash
git add .claude/commands/new-spec.md
git commit -m "feat: add /new-spec command"
```

---

## Task 12: Create Command - /spec

**Files:**
- Create: `.claude/commands/spec.md`

**Step 1: Create command**

```markdown
---
name: spec
description: Load a specification into context
args: id - The spec ID (e.g., SPEC-001) or name pattern to search
---

Load a specification document into context:

1. If ID provided (SPEC-NNN format), load `docs/specs/SPEC-NNN-*.md`
2. If name provided, search docs/specs/ for matching files
3. If multiple matches, show list and ask user to choose
4. If no matches, show available specs
5. Once loaded, show spec summary and ask what user wants to do

Also load any documents listed in the spec's `relates-to` frontmatter for full context.
```

**Step 2: Commit**

```bash
git add .claude/commands/spec.md
git commit -m "feat: add /spec command"
```

---

## Task 13: Create Command - /schema

**Files:**
- Create: `.claude/commands/schema.md`

**Step 1: Create command**

```markdown
---
name: schema
description: Load schema documents into context
args: type - Optional: data-model, api, database, or all (default: all)
---

Load schema documents into context:

1. If type is "data-model" or "data", load `docs/schemas/data-model.md`
2. If type is "api", load `docs/schemas/api-schema.md`
3. If type is "database" or "db", load `docs/schemas/database-schema.md`
4. If type is "all" or not provided, load all three
5. Show summary of loaded schemas

If a schema file doesn't exist, offer to create it from template using the `writing-schemas` skill.
```

**Step 2: Commit**

```bash
git add .claude/commands/schema.md
git commit -m "feat: add /schema command"
```

---

## Task 14: Create Command - /new-project

**Files:**
- Create: `.claude/commands/new-project.md`

**Step 1: Create command**

```markdown
---
name: new-project
description: Scaffold a new project with complete workflow structure
args: name - Optional project name
---

Initialize a new project with the Superpowers workflow:

1. Ask for project name if not provided
2. Invoke the `project-scaffolding` skill
3. Create all directories, templates, skills, commands, and hooks
4. Initialize git if not already a repo
5. Create initial commit
6. Show next steps

This command creates a complete project structure ready for spec-driven development.
```

**Step 2: Commit**

```bash
git add .claude/commands/new-project.md
git commit -m "feat: add /new-project command"
```

---

## Task 15: Create Hook - context-loader

**Files:**
- Create: `.claude/hooks/context-loader.sh`

**Step 1: Create hook**

```bash
#!/bin/bash
# context-loader.sh - Analyzes prompts and suggests relevant documents
# Hook type: UserPromptSubmit
# Exit 0: Always (advisory only)

PROMPT="$1"
DOCS_DIR="docs"

# Convert to lowercase for matching
PROMPT_LOWER=$(echo "$PROMPT" | tr '[:upper:]' '[:lower:]')

# Check for keywords and suggest relevant docs
suggest_docs() {
    local suggestions=""

    # API-related keywords
    if echo "$PROMPT_LOWER" | grep -qE "(api|endpoint|rest|request|response)"; then
        if [ -f "$DOCS_DIR/schemas/api-schema.md" ]; then
            suggestions="$suggestions\n- docs/schemas/api-schema.md"
        fi
    fi

    # Database-related keywords
    if echo "$PROMPT_LOWER" | grep -qE "(database|table|schema|sql|query|migration)"; then
        if [ -f "$DOCS_DIR/schemas/database-schema.md" ]; then
            suggestions="$suggestions\n- docs/schemas/database-schema.md"
        fi
    fi

    # Data model keywords
    if echo "$PROMPT_LOWER" | grep -qE "(model|entity|domain|data model)"; then
        if [ -f "$DOCS_DIR/schemas/data-model.md" ]; then
            suggestions="$suggestions\n- docs/schemas/data-model.md"
        fi
    fi

    # Spec ID pattern (SPEC-NNN)
    if echo "$PROMPT" | grep -qE "SPEC-[0-9]+"; then
        SPEC_ID=$(echo "$PROMPT" | grep -oE "SPEC-[0-9]+" | head -1)
        SPEC_FILE=$(find "$DOCS_DIR/specs" -name "${SPEC_ID}*.md" 2>/dev/null | head -1)
        if [ -n "$SPEC_FILE" ]; then
            suggestions="$suggestions\n- $SPEC_FILE"
        fi
    fi

    # Output suggestions if any
    if [ -n "$suggestions" ]; then
        echo -e "📄 Relevant docs for context:$suggestions"
    fi
}

suggest_docs

exit 0
```

**Step 2: Make executable and commit**

```bash
chmod +x .claude/hooks/context-loader.sh
git add .claude/hooks/context-loader.sh
git commit -m "feat: add context-loader hook"
```

---

## Task 16: Create Hook - spec-gate

**Files:**
- Create: `.claude/hooks/spec-gate.sh`

**Step 1: Create hook**

```bash
#!/bin/bash
# spec-gate.sh - Advisory warning when editing code without active spec
# Hook type: PreToolUse (Edit|Write)
# Exit 0: Always (advisory, non-blocking)

TOOL_INPUT="$1"

# Check if this is editing a source file (not docs, not config)
is_source_file() {
    local file="$1"
    # Skip docs, config, and test files for this check
    if echo "$file" | grep -qE "^(docs/|\.claude/|\.github/|node_modules/|__pycache__|\.git)"; then
        return 1
    fi
    # Check if it's a code file
    if echo "$file" | grep -qE "\.(js|ts|py|go|rs|java|rb|php|swift|kt)$"; then
        return 0
    fi
    return 1
}

# Check for active spec in CLAUDE.md
has_active_spec() {
    if [ -f "CLAUDE.md" ]; then
        if grep -q "Active spec: SPEC-" "CLAUDE.md"; then
            return 0
        fi
    fi
    return 1
}

# Extract file path from tool input (simplified)
FILE_PATH=$(echo "$TOOL_INPUT" | grep -oE '"file_path":\s*"[^"]+"' | sed 's/"file_path":\s*"//' | sed 's/"$//')

if [ -n "$FILE_PATH" ] && is_source_file "$FILE_PATH"; then
    if ! has_active_spec; then
        echo "💡 Tip: No active spec found. Consider running /new-spec to create one first."
        echo "   Spec-driven development helps ensure features are well-defined before coding."
    fi
fi

exit 0
```

**Step 2: Make executable and commit**

```bash
chmod +x .claude/hooks/spec-gate.sh
git add .claude/hooks/spec-gate.sh
git commit -m "feat: add spec-gate hook"
```

---

## Task 17: Create Hook - update-status

**Files:**
- Create: `.claude/hooks/update-status.sh`

**Step 1: Create hook**

```bash
#!/bin/bash
# update-status.sh - Updates CLAUDE.md with current work status
# Hook type: PostToolUse (Edit|Write)
# Exit 0: Always

# This hook could update CLAUDE.md's "Active Work" section
# For now, it's a placeholder that can be enhanced later

# Future enhancements:
# - Track which files were modified
# - Update "Active Work" section in CLAUDE.md
# - Track implementation progress against plan

exit 0
```

**Step 2: Make executable and commit**

```bash
chmod +x .claude/hooks/update-status.sh
git add .claude/hooks/update-status.sh
git commit -m "feat: add update-status hook (placeholder)"
```

---

## Task 18: Create Hook Configuration

**Files:**
- Create: `.claude/settings.json`

**Step 1: Create settings file**

```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "matcher": ".*",
        "command": ".claude/hooks/context-loader.sh"
      }
    ],
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "command": ".claude/hooks/spec-gate.sh"
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "command": ".claude/hooks/update-status.sh"
      }
    ]
  }
}
```

**Step 2: Commit**

```bash
git add .claude/settings.json
git commit -m "feat: add hooks configuration"
```

---

## Task 19: Create Guide - Getting Started

**Files:**
- Create: `docs/guides/getting-started.md`

**Step 1: Create guide**

```markdown
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
```

**Step 2: Commit**

```bash
git add docs/guides/getting-started.md
git commit -m "docs: add getting started guide"
```

---

## Task 20: Create Guide - Workflow Reference

**Files:**
- Create: `docs/guides/workflow-guide.md`

**Step 1: Create comprehensive workflow guide**

```markdown
# Superpowers Workflow Reference

Complete reference for the spec-driven development workflow.

## Workflow Stages

### Stage 1: IDEATION

**Purpose:** Explore ideas and validate feasibility

**Entry:** New idea or problem statement

**Activities:**
- Use `/brainstorm` to explore the idea
- Ask clarifying questions
- Identify constraints and requirements
- Validate technical feasibility

**Exit Criteria:**
- Clear problem statement
- Validated value proposition
- Stakeholder alignment

**Outputs:**
- Updated `docs/business/vision.md`
- Initial notes or design sketches

**Skill:** `superpowers:brainstorming`

---

### Stage 2: DESIGN

**Purpose:** Define architecture and technical approach

**Entry:** Approved concept from ideation

**Activities:**
- Define system architecture
- Design data model
- Specify API contracts
- Make technology decisions

**Exit Criteria:**
- Architecture documented
- Schemas defined
- Major decisions recorded as ADRs

**Outputs:**
- `docs/designs/YYYY-MM-DD-feature-design.md`
- `docs/schemas/data-model.md`
- `docs/schemas/api-schema.md`
- `docs/decisions/ADR-NNN-*.md`

**Skills:** `superpowers:brainstorming`, `writing-schemas`

---

### Stage 3: SPECIFICATION

**Purpose:** Define detailed requirements and acceptance criteria

**Entry:** Completed design

**Activities:**
- Write user stories
- Define acceptance criteria
- Identify edge cases
- Specify error handling

**Exit Criteria:**
- All user stories have acceptance criteria
- Edge cases documented
- Security considerations addressed
- Spec status set to "approved"

**Outputs:**
- `docs/specs/SPEC-NNN-feature.md`

**Command:** `/new-spec [name]`
**Skill:** `writing-specs`

---

### Stage 4: PLANNING

**Purpose:** Break spec into implementable tasks

**Entry:** Approved spec

**Activities:**
- Break into small tasks (2-5 minutes each)
- Identify files to create/modify
- Write code snippets
- Define test approach

**Exit Criteria:**
- All tasks defined with clear steps
- File paths specified
- Code provided (not "add validation")
- Plan status set to "ready"

**Outputs:**
- `docs/plans/YYYY-MM-DD-feature-plan.md`

**Command:** `/write-plan`
**Skill:** `superpowers:writing-plans`

---

### Stage 5: IMPLEMENTATION

**Purpose:** Execute the plan using TDD

**Entry:** Approved plan

**Activities:**
- Execute tasks in order
- Write tests first (TDD)
- Commit after each task
- Self-review before moving on

**Exit Criteria:**
- All tasks complete
- All tests passing
- Code committed

**Outputs:**
- Source code
- Tests
- Updated documentation if needed

**Command:** `/execute-plan`
**Skills:** `superpowers:executing-plans`, `superpowers:subagent-driven-development`, `superpowers:test-driven-development`

---

### Stage 6: REVIEW

**Purpose:** Validate implementation against spec

**Entry:** Implementation complete

**Activities:**
- Request code review
- Verify spec compliance
- Address feedback
- Update documentation

**Exit Criteria:**
- Code review approved
- Spec compliance verified
- All feedback addressed

**Command:** `/review`
**Skill:** `superpowers:requesting-code-review`

---

### Stage 7: COMPLETION

**Purpose:** Merge and close out work

**Entry:** Review approved

**Activities:**
- Merge to main branch
- Update spec status to "complete"
- Clean up feature branch
- Update documentation index

**Exit Criteria:**
- Code merged
- Spec marked complete
- Branch cleaned up

**Command:** `/finish`
**Skill:** `superpowers:finishing-a-development-branch`

---

## Document Relationships

```
docs/business/vision.md
    ↓
docs/specs/SPEC-NNN-feature.md
    ↓
docs/schemas/data-model.md
docs/schemas/api-schema.md
docs/schemas/database-schema.md
    ↓
docs/designs/YYYY-MM-DD-feature-design.md
    ↓
docs/plans/YYYY-MM-DD-feature-plan.md
    ↓
Implementation
```

## Frontmatter Reference

### Spec Frontmatter

```yaml
---
id: SPEC-001
title: Feature Name
created: 2026-01-22
updated: 2026-01-22
status: draft | review | approved | in-progress | complete
author: Name
relates-to:
  - docs/schemas/data-model.md
  - docs/designs/2026-01-22-feature-design.md
---
```

### Status Values

| Status | Meaning |
|--------|---------|
| `draft` | Being written, not ready for review |
| `review` | Ready for review |
| `approved` | Reviewed and approved for implementation |
| `in-progress` | Currently being implemented |
| `complete` | Implementation done and merged |

## Tips for Success

1. **Don't skip stages** - Each stage builds on the previous
2. **Keep docs updated** - Documents are living artifacts
3. **Use templates** - Start from `_template.md` files
4. **Commit often** - One task = one commit
5. **Review continuously** - Don't wait until the end
```

**Step 2: Commit**

```bash
git add docs/guides/workflow-guide.md
git commit -m "docs: add workflow reference guide"
```

---

## Task 21: Create Guide - Contributing

**Files:**
- Create: `docs/guides/contributing.md`

**Step 1: Create contributing guide**

```markdown
# Contributing to This Project

## Development Workflow

This project uses the Superpowers spec-driven workflow. All contributions should follow these stages:

1. **Discuss** - Open an issue to discuss the change
2. **Specify** - Create a spec document with `/new-spec`
3. **Plan** - Create an implementation plan with `/write-plan`
4. **Implement** - Execute the plan with `/execute-plan`
5. **Review** - Request review with `/review`
6. **Merge** - Complete with `/finish`

## Quick Contribution Guide

### For Bug Fixes

1. Create a spec: `/new-spec fix-[bug-name]`
2. Define the bug and expected behavior
3. Create a plan
4. Fix with TDD (test that reproduces bug first)
5. Submit PR

### For New Features

1. Start with ideation: `/brainstorm [feature-idea]`
2. Create design document
3. Create spec: `/new-spec [feature-name]`
4. Create implementation plan
5. Implement with TDD
6. Submit PR

## Code Standards

- Follow existing code style
- Write tests for all new code
- Keep commits atomic (one task = one commit)
- Use conventional commit messages:
  - `feat:` for new features
  - `fix:` for bug fixes
  - `docs:` for documentation
  - `refactor:` for refactoring
  - `test:` for tests

## Documentation Standards

- Use templates from `docs/*/`
- Include frontmatter with required fields
- Keep specs and plans updated as work progresses
- Update `docs/README.md` index when adding docs

## Pull Request Process

1. Ensure all tests pass
2. Update documentation
3. Reference the spec in PR description
4. Request review
5. Address feedback
6. Squash and merge

## Getting Help

- Check `/status` for current state
- Read `docs/guides/getting-started.md`
- Open an issue for questions
```

**Step 2: Commit**

```bash
git add docs/guides/contributing.md
git commit -m "docs: add contributing guide"
```

---

## Task 22: Create CLAUDE.md

**Files:**
- Create: `CLAUDE.md`

**Step 1: Create project memory file**

```markdown
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
```

**Step 2: Commit**

```bash
git add CLAUDE.md
git commit -m "feat: add CLAUDE.md project memory"
```

---

## Task 23: Update Root README

**Files:**
- Modify: `README.md`

**Step 1: Update README with workflow information**

```markdown
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
```

**Step 2: Commit**

```bash
git add README.md
git commit -m "docs: update README with workflow documentation"
```

---

## Task 24: Final Verification and Push

**Step 1: Verify all files created**

```bash
echo "=== New Skills ===" && ls -la skills/workflow-navigator skills/writing-specs skills/writing-schemas skills/project-scaffolding
echo "=== Commands ===" && ls -la .claude/commands/
echo "=== Hooks ===" && ls -la .claude/hooks/
echo "=== Guides ===" && ls -la docs/guides/
echo "=== Templates ===" && find docs -name "_template*.md"
```

**Step 2: Verify git log**

```bash
git log --oneline | head -25
```

**Step 3: Push to remote**

```bash
git push origin main
```

**Step 4: Final status**

```bash
git status
```

Expected: "nothing to commit, working tree clean"
