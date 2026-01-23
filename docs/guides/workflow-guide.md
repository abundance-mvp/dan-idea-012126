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
