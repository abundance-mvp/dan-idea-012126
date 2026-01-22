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
- Bad: "System should be fast" (not testable)
- Good: "API response time < 200ms for 95th percentile" (testable)

## After Writing

1. Save to `docs/specs/SPEC-NNN-feature-name.md`
2. Update `docs/README.md` index
3. Set status to "review"
4. Commit the spec

## Related Skills

- `superpowers:brainstorming` - Use first for ideation
- `superpowers:writing-plans` - Use after spec is approved
