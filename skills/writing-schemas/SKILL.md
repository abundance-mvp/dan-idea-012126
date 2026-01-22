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
