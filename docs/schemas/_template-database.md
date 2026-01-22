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
