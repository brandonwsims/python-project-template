# Version Management with Conventional Commits

This project uses [Commitizen](https://commitizen-tools.github.io/commitizen/) for automatic version management based on conventional commits.

## Why Conventional Commits?

- **Automated versioning**: Versions bump automatically based on commit types
- **Changelog generation**: CHANGELOG.md is auto-generated
- **Semantic versioning**: Follows SemVer (MAJOR.MINOR.PATCH)
- **Clear history**: Standardized commit messages make history readable
- **CI/CD integration**: Enables automated releases

## Commit Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types and Version Bumps

| Type | Version Bump | Example |
|------|--------------|---------|
| `feat` | MINOR (0.x.0) | `feat: add user authentication` |
| `fix` | PATCH (0.0.x) | `fix: resolve memory leak` |
| `feat!` or `BREAKING CHANGE:` | MAJOR (x.0.0) | `feat!: redesign API` |
| `docs` | None | `docs: update README` |
| `style` | None | `style: format code` |
| `refactor` | None | `refactor: extract helper function` |
| `perf` | PATCH (0.0.x) | `perf: optimize query` |
| `test` | None | `test: add user tests` |
| `build` | None | `build: update dependencies` |
| `ci` | None | `ci: add deployment step` |
| `chore` | None | `chore: update gitignore` |

## Writing Commits

### Manual

```bash
# Feature (minor bump)
git commit -m "feat: add export to CSV functionality"

# Bug fix (patch bump)
git commit -m "fix: correct date formatting in reports"

# Breaking change (major bump)
git commit -m "feat!: change API response format

BREAKING CHANGE: API now returns data in camelCase instead of snake_case"

# With scope
git commit -m "feat(api): add rate limiting"

# With body
git commit -m "fix: resolve race condition in cache

The cache was not properly locked during concurrent access,
leading to inconsistent state."
```

### Using Commitizen

Interactive helper for creating commits:

```bash
# Start interactive commit
cz commit

# Or use the git alias
git cz
```

This will guide you through:
1. Selecting commit type
2. Optional scope
3. Short description
4. Optional longer description
5. Breaking changes (if any)
6. Issues closed (if any)

## Version Bumping

### Automatic Bump

Commitizen analyzes commits since the last tag and determines the version bump:

```bash
# Bump version based on commits
make bump

# Or directly
cz bump
```

This will:
1. Analyze commits since last tag
2. Determine version bump (major/minor/patch)
3. Update version in configured files
4. Generate/update CHANGELOG.md
5. Create a git commit with version changes
6. Create a git tag (e.g., `v0.2.0`)

### Manual Bump

Override automatic detection:

```bash
# Force specific bump
cz bump --increment MAJOR
cz bump --increment MINOR
cz bump --increment PATCH

# Dry run (see what would happen)
cz bump --dry-run
```

### With Changelog

```bash
# Bump and update changelog
cz bump --changelog

# Just update changelog (no version bump)
make changelog
# or
cz changelog
```

## Configuration

Version management is configured in `pyproject.toml`:

```toml
[tool.commitizen]
name = "cz_conventional_commits"
version = "0.1.0"
version_files = [
    "pyproject.toml:version",
    "src/template/__init__.py:__version__"
]
tag_format = "v$version"
update_changelog_on_bump = true
annotated_tag = true
```

### Version Files

Commitizen updates the version in multiple files:
- `pyproject.toml` - Project metadata
- `src/package/__init__.py` - `__version__` variable

### Tag Format

Tags follow the format `v0.1.0` (configurable in `tag_format`).

## Pre-commit Hook

Conventional commits are enforced via pre-commit hook:

```yaml
- repo: https://github.com/commitizen-tools/commitizen
  rev: v3.29.1
  hooks:
    - id: commitizen
      stages: [commit-msg]
```

This validates commit messages and rejects non-compliant commits.

## Changelog

The CHANGELOG.md is auto-generated based on commits:

```markdown
## v0.2.0 (2024-12-18)

### Feat

- add user authentication
- add CSV export functionality

### Fix

- resolve memory leak in cache
- correct date formatting

## v0.1.0 (2024-12-01)

### Feat

- initial release
```

## Examples

### Adding a Feature

```bash
git add src/auth.py test/test_auth.py
cz commit
# Select: feat
# Scope: auth
# Description: add JWT token authentication
# Long description: Implements JWT-based authentication with refresh tokens
# Breaking: No
# Issues: Closes #45

# Result:
# feat(auth): add JWT token authentication
#
# Implements JWT-based authentication with refresh tokens
#
# Closes #45
```

### Fixing a Bug

```bash
git add src/cache.py
git commit -m "fix: prevent race condition in cache access

Added proper locking mechanism to prevent concurrent access issues.
Fixes #78"
```

### Breaking Change

```bash
git add src/api.py
cz commit
# Select: feat
# Scope: api
# Description: redesign response format
# Long description: API responses now use camelCase
# Breaking: Yes
# Breaking description: API responses changed from snake_case to camelCase
# Issues: None

# Result:
# feat(api)!: redesign response format
#
# API responses now use camelCase
#
# BREAKING CHANGE: API responses changed from snake_case to camelCase
```

## Workflow Integration

### Local Development

1. Make changes
2. Write tests
3. Commit with conventional format
4. Push to feature branch

### Pull Requests

1. PR title should follow conventional commits
2. Squash merge with conventional commit message
3. Version bump happens on merge to main

### Release Process

```bash
# 1. Ensure you're on main branch
git checkout main
git pull

# 2. Bump version
make bump

# 3. Push changes and tags
git push
git push --tags

# 4. GitHub Actions automatically publishes to PyPI (if configured)
```

## Common Patterns

### Multiple Changes

Group related changes:

```bash
# One commit per logical change
git commit -m "feat: add user registration"
git commit -m "feat: add email verification"
git commit -m "docs: update auth guide"
```

### Incremental Features

```bash
# WIP commits during development
git commit -m "feat: add user model (WIP)"
git commit -m "feat: add user endpoints (WIP)"

# Squash before merge
git rebase -i HEAD~2
# Result: feat: add user management system
```

### Hotfixes

```bash
# Critical bug fix
git commit -m "fix!: prevent data loss in save operation

CRITICAL: This fixes a data loss issue affecting all users.
Upgrades are strongly recommended."
```

## Best Practices

1. **Commit often**: Small, focused commits are better
2. **Clear descriptions**: Make it obvious what changed and why
3. **Reference issues**: Use `Closes #123` or `Fixes #456`
4. **Use scope**: Help categorize changes (e.g., `feat(api)`, `fix(auth)`)
5. **Breaking changes**: Always document in footer
6. **Test first**: Ensure tests pass before committing
7. **Review history**: Check `git log` for context

## Troubleshooting

### Rejected Commit Message

```bash
# Error: commit message doesn't follow conventional format

# Fix: Rewrite commit message
git commit --amend
```

### Wrong Version Bump

```bash
# Undo last version bump
git reset --hard HEAD~1
git tag -d v0.2.0

# Redo with correct increment
cz bump --increment PATCH
```

### Skip Validation

Only for emergencies:

```bash
git commit --no-verify -m "emergency fix"
```

## Further Reading

- [Conventional Commits Specification](https://www.conventionalcommits.org/)
- [Commitizen Documentation](https://commitizen-tools.github.io/commitizen/)
- [Semantic Versioning](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)
