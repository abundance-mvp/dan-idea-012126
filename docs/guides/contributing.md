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
