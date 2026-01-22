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
