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
