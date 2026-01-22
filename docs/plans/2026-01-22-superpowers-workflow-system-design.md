# Superpowers Workflow System Design

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:writing-plans to create the implementation plan from this design.

**Goal:** Create a deterministic, spec-driven workflow system that guides projects from idea to implementation with smart context management.

**Architecture:** Plugin-based system with skills for each workflow stage, hooks for automation, and a centralized docs/ structure for all specifications.

**Research Sources:**
- [ChrisWiles/claude-code-showcase](https://github.com/ChrisWiles/claude-code-showcase) - Comprehensive hooks and automation patterns
- [wshobson/agents](https://github.com/wshobson/agents) - Multi-agent orchestration with 108 agents and progressive disclosure
- [VoltAgent/awesome-claude-skills](https://github.com/VoltAgent/awesome-claude-skills) - Community skills collection
- [hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) - Curated resources and best practices

---

## 1. System Overview & Philosophy

The **Superpowers Development Workflow** is a deterministic, spec-driven approach to software development that leverages Claude Code's plugin architecture to guide projects from idea to implementation.

### Core Philosophy

- **Spec-First Development**: Every feature starts as a spec document before code is written
- **Progressive Elaboration**: Specs evolve from high-level design → detailed implementation plans → code
- **Automated Context Management**: Hooks and CLAUDE.md ensure Claude always has relevant spec context
- **Deterministic Workflow**: Clear stages with explicit entry/exit criteria prevent ad-hoc development

### The Workflow Stages

```
1. IDEATION → 2. DESIGN → 3. SPECIFICATION → 4. PLANNING → 5. IMPLEMENTATION → 6. REVIEW → 7. COMPLETION
```

Each stage produces specific artifacts in `docs/` and has corresponding skills that guide execution.

---

## 2. Document Structure & Hierarchy

```
docs/
├── README.md                    # Index of all documentation
├── business/                    # Business & product documentation
│   ├── vision.md               # Product vision, target market
│   ├── requirements.md         # Business requirements
│   ├── cost-forecast.md        # Cost projections, pricing
│   ├── market-analysis.md      # Target market, competitors
│   └── success-metrics.md      # KPIs, OKRs
├── specs/                       # Feature specifications
│   ├── SPEC-001-feature-name.md
│   └── _template.md
├── schemas/                     # Technical schemas & models
│   ├── data-model.md           # Entity relationships, domain model
│   ├── api-schema.md           # API endpoints, contracts
│   ├── database-schema.md      # Tables, indexes, migrations
│   └── events.md               # Event schemas (if event-driven)
├── designs/                     # Architecture & design decisions
│   ├── YYYY-MM-DD-topic-design.md
│   └── _template.md
├── plans/                       # Implementation plans
│   ├── YYYY-MM-DD-feature-plan.md
│   └── _template.md
├── decisions/                   # Architecture Decision Records
│   ├── ADR-001-technology-choice.md
│   └── _template.md
└── guides/                      # How-to documentation
    ├── getting-started.md
    ├── workflow-guide.md
    └── contributing.md
```

### Document Relationships

- **business/** - Product/market docs that inform *why* we're building
- **specs/** - Feature specifications that define *what* to build
- **schemas/** - Technical contracts that define *what shape* things take
- **designs/** - Architecture docs that define *how* to build it
- **plans/** - Implementation plans that define *the steps* to build it
- **decisions/** - ADRs that capture *why* choices were made

### Document Flow

```
business/ (why) → specs/ (what) → schemas/ (shape) → designs/ (how) → plans/ (steps)
```

### Naming Conventions

- Specs: `SPEC-NNN-kebab-case-name.md` (numbered for ordering)
- Designs: `YYYY-MM-DD-topic-design.md` (dated for history)
- Plans: `YYYY-MM-DD-feature-plan.md` (dated, ties to designs)
- ADRs: `ADR-NNN-short-title.md` (numbered, immutable once accepted)

---

## 3. Smart Context Management

### CLAUDE.md as the Index

```markdown
# Project: [Name]

## Documentation Map
- Business context: docs/business/vision.md
- Current specs: docs/specs/ (see docs/README.md for index)
- Data model: docs/schemas/data-model.md
- API contracts: docs/schemas/api-schema.md

## Active Work
<!-- Auto-updated by hooks -->
- Current spec: SPEC-003-user-auth
- Current plan: 2026-01-22-auth-implementation-plan.md

## Quick Commands
- /spec [name] - Load a spec into context
- /schema - Load all schemas
- /status - Show workflow status
```

### Hook-Based Context Loading

A `UserPromptSubmit` hook analyzes messages and auto-loads relevant docs:
- Mentions "auth" or "login" → loads SPEC for auth feature
- Mentions "API" or "endpoint" → loads api-schema.md
- Mentions "database" or "model" → loads data-model.md + database-schema.md
- Mentions "plan" or "task" → loads active plan

### Frontmatter Linking

```yaml
---
id: SPEC-003
title: User Authentication
status: in-progress
relates-to:
  - docs/schemas/data-model.md#User
  - docs/schemas/api-schema.md#auth-endpoints
  - docs/business/requirements.md#security
---
```

When a spec is loaded, the hook can optionally load its `relates-to` documents for full context.

---

## 4. Workflow Stages

### Stage 1: IDEATION

| Attribute | Value |
|-----------|-------|
| Entry | New idea or problem statement |
| Activities | Brainstorm, explore alternatives, validate feasibility |
| Exit | Approved concept with clear value proposition |
| Output | docs/business/vision.md (or update), initial notes |
| Skill | `superpowers:brainstorming` |

### Stage 2: DESIGN

| Attribute | Value |
|-----------|-------|
| Entry | Approved concept from ideation |
| Activities | Define architecture, data model, API contracts, component design |
| Exit | Technical approach validated, schemas defined |
| Output | docs/designs/YYYY-MM-DD-feature-design.md, docs/schemas/*, docs/decisions/ADR-NNN-*.md |
| Skill | `superpowers:brainstorming` (architecture mode) |

### Stage 3: SPECIFICATION

| Attribute | Value |
|-----------|-------|
| Entry | Completed design |
| Activities | Write detailed requirements, acceptance criteria, edge cases |
| Exit | Spec reviewed and approved (status: approved) |
| Output | docs/specs/SPEC-NNN-feature.md |
| Skill | `writing-specs` (NEW) |

### Stage 4: PLANNING

| Attribute | Value |
|-----------|-------|
| Entry | Approved spec |
| Activities | Break into tasks, identify files, write code snippets |
| Exit | Plan with all tasks defined, ready for implementation |
| Output | docs/plans/YYYY-MM-DD-feature-plan.md |
| Skill | `superpowers:writing-plans` |

### Stage 5: IMPLEMENTATION

| Attribute | Value |
|-----------|-------|
| Entry | Approved plan |
| Activities | Execute tasks using TDD, commit frequently |
| Exit | All tasks complete, tests passing |
| Output | Code, tests, updated schemas if needed |
| Skills | `superpowers:subagent-driven-development` or `superpowers:executing-plans` |

### Stage 6: REVIEW & COMPLETION

| Attribute | Value |
|-----------|-------|
| Entry | Implementation complete |
| Activities | Code review, spec compliance check, update docs |
| Exit | Merged to main, spec marked complete |
| Output | Updated spec status, PR/merge |
| Skills | `superpowers:requesting-code-review`, `superpowers:finishing-a-development-branch` |

---

## 5. Skills & Commands

### Commands That Invoke Existing Skills

| Command | Delegates To | Notes |
|---------|--------------|-------|
| `/brainstorm [topic]` | `superpowers:brainstorming` | Ideation & design |
| `/write-plan` | `superpowers:writing-plans` | Creates implementation plans |
| `/execute-plan` | `superpowers:executing-plans` or `subagent-driven-development` | User chooses mode |
| `/review` | `superpowers:requesting-code-review` | Code review |
| `/finish` | `superpowers:finishing-a-development-branch` | Branch completion |

### New Commands

| Command | Purpose | New Skill? |
|---------|---------|------------|
| `/new-project` | Scaffold project with docs structure, templates, hooks | Yes: `project-scaffolding` |
| `/new-spec [name]` | Create spec from template, invoke `writing-specs` | Yes: `writing-specs` |
| `/new-adr [title]` | Create ADR from template | No - simple template |
| `/spec [id]` | Load spec into context | No - hook/command only |
| `/schema [type]` | Load schemas into context | No - hook/command only |
| `/status` | Show workflow status | Yes: `workflow-navigator` |

### Workflow → Skill Mapping

```
IDEATION      → /brainstorm        → superpowers:brainstorming
DESIGN        → /brainstorm        → superpowers:brainstorming (architecture mode)
SPECIFICATION → /new-spec          → writing-specs (NEW)
PLANNING      → /write-plan        → superpowers:writing-plans
IMPLEMENTATION→ /execute-plan      → superpowers:executing-plans OR subagent-driven-development
REVIEW        → /review            → superpowers:requesting-code-review
COMPLETION    → /finish            → superpowers:finishing-a-development-branch
```

### New Skills Required

| Skill | Purpose |
|-------|---------|
| `writing-specs` | Guide spec creation with acceptance criteria, edge cases |
| `writing-schemas` | Guide data model & API schema creation |
| `project-scaffolding` | Initialize project with full docs structure |
| `workflow-navigator` | Show status, suggest next steps, load context |

---

## 6. Hooks & Automation

### Hook Configuration (.claude/settings.json)

```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "matcher": ".*",
        "command": "hooks/context-loader.sh \"$PROMPT\""
      }
    ],
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "command": "hooks/spec-gate.sh \"$TOOL_INPUT\""
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "command": "hooks/update-status.sh \"$TOOL_INPUT\""
      }
    ]
  }
}
```

### Hook Behaviors

| Hook | File | Purpose |
|------|------|---------|
| `context-loader.sh` | UserPromptSubmit | Analyzes prompt, auto-loads relevant specs/schemas |
| `spec-gate.sh` | PreToolUse | Warns if editing code without approved spec (non-blocking) |
| `update-status.sh` | PostToolUse | Updates CLAUDE.md "Active Work" section after file changes |

### Context Loader Logic

```bash
# Pseudocode for context-loader.sh
if prompt mentions feature name → load matching spec
if prompt mentions "api" or "endpoint" → load api-schema.md
if prompt mentions "database" or "model" → load data-model.md
if prompt mentions "plan" or "task" → load active plan
if prompt mentions spec ID (SPEC-NNN) → load that spec
```

### Automation Principles

- Hooks are **advisory**, not blocking (exit 0) - guide, don't frustrate
- Only `PreToolUse` on protected branches should block (exit 2)
- Keep hooks fast (<500ms) to avoid UX lag

---

## 7. Project Scaffolding

When `/new-project` is invoked, the `project-scaffolding` skill creates:

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
├── skills/                    # Project-specific skills
│   ├── writing-specs/
│   │   └── SKILL.md
│   ├── writing-schemas/
│   │   └── SKILL.md
│   ├── project-scaffolding/
│   │   └── SKILL.md
│   └── workflow-navigator/
│       └── SKILL.md
├── docs/
│   ├── README.md              # Documentation index
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
├── CLAUDE.md                  # Project memory
├── README.md
└── .gitignore
```

---

## 8. Implementation Requirements

### New Skills to Create (4)

| Skill | Files | Complexity |
|-------|-------|------------|
| `writing-specs` | SKILL.md, spec-template.md | Medium |
| `writing-schemas` | SKILL.md, templates for data/api/db | Medium |
| `project-scaffolding` | SKILL.md, scaffold.sh, all templates | High |
| `workflow-navigator` | SKILL.md | Low |

### New Commands to Create (5)

| Command | File |
|---------|------|
| `/new-project` | commands/new-project.md |
| `/new-spec` | commands/new-spec.md |
| `/spec` | commands/spec.md |
| `/schema` | commands/schema.md |
| `/status` | commands/status.md |

### New Hooks to Create (3)

| Hook | File |
|------|------|
| context-loader | hooks/context-loader.sh |
| spec-gate | hooks/spec-gate.sh |
| update-status | hooks/update-status.sh |

### Documentation to Create

| Document | Purpose |
|----------|---------|
| `docs/guides/getting-started.md` | How to start using the workflow |
| `docs/guides/workflow-guide.md` | Complete workflow reference |
| `docs/guides/contributing.md` | How to contribute to this project |
| Template files | All `_template.md` files for each doc type |

### Estimated Scope

~15-20 new files organized into:
- 4 skills
- 5 commands
- 3 hooks
- Supporting documentation and templates
