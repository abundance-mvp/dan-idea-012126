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
