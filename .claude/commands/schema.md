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
