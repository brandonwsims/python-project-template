# Quick Reference Card

## Essential Commands

```bash
# Setup
uv pip install -e ".[dev]"
pre-commit install
pre-commit install --hook-type commit-msg

# Development
make test                    # Run tests
make lint                    # Check with ruff
make format                  # Format with ruff
make typecheck              # Check types with ty
make docstyle               # Check docstrings
make security               # Run security scans
make pre-commit             # Run all hooks

# Version Management
cz commit                    # Interactive commit
make bump                    # Bump version
make changelog              # Generate CHANGELOG

# Maintenance
uv lock                      # Update lock file
uv pip list --outdated      # Check outdated deps
```

## File Locations

| What | Where |
|------|-------|
| Source code | `src/template/` |
| Tests | `test/` |
| Documentation | `docs/` |
| Configuration | `pyproject.toml` |
| Dependencies | `uv.lock` |
| Pre-commit | `.pre-commit-config.yaml` |
| CI/CD | `.github/workflows/ci.yml` |
| Examples | `src/template/example.py` |

## Tool Versions

| Tool | Version | Purpose |
|------|---------|---------|
| Python | 3.11+ | Required |
| uv | latest | Package manager |
| pytest | 9.x | Testing |
| pytest-cov | 7.x | Coverage |
| ruff | 0.8.x | Lint + format |
| ty | 0.0.4 | Type checking |
| pydocstyle | 6.x | Docstring style |
| bandit | 1.8.x | Security |
| safety | 3.x | Vulnerabilities |
| commitizen | 4.x | Versioning |
| pre-commit | 4.x | Git hooks |
| pydantic | 2.x | Validation |

## Configuration Locations

| Tool | Config Location |
|------|----------------|
| ruff | `[tool.ruff]` in pyproject.toml |
| ty | `[tool.pyright]` in pyproject.toml |
| pytest | `[tool.pytest.ini_options]` in pyproject.toml |
| pydocstyle | `[tool.pydocstyle]` in pyproject.toml |
| bandit | `[tool.bandit]` in pyproject.toml |
| commitizen | `[tool.commitizen]` in pyproject.toml |

## Commit Types

| Type | Version Bump | Use For |
|------|--------------|---------|
| feat | MINOR | New features |
| fix | PATCH | Bug fixes |
| docs | none | Documentation only |
| style | none | Formatting |
| refactor | none | Code restructuring |
| perf | PATCH | Performance |
| test | none | Tests |
| build | none | Build system |
| ci | none | CI config |
| chore | none | Maintenance |
| BREAKING CHANGE | MAJOR | Breaking changes |

## reST Docstring Template

```python
def function(param1: type1, param2: type2 = default) -> return_type:
    """One-line summary.

    Optional longer description.

    :param param1: Description.
    :type param1: type1
    :param param2: Description. Defaults to default.
    :type param2: type2
    :return: Description.
    :rtype: return_type
    :raises ExceptionType: When raised.

    :Example:

    >>> function(arg1, arg2)
    result
    """
    pass
```

## Ruff Line Length

**79 characters** - Strictly enforced

## Common Issues & Solutions

### Type Checking Fails
```bash
# Check configuration
ty check
# View pyright config
grep -A 10 "\[tool.pyright\]" pyproject.toml
```

### Docstring Errors
```bash
# Check style
pydocstyle src/
# See examples
cat src/template/example.py
```

### Pre-commit Hook Fails
```bash
# Run manually to see details
pre-commit run --all-files
# Update hooks
pre-commit autoupdate
```

### Dependencies Out of Sync
```bash
# Reinstall
uv pip install -e ".[dev]"
# Update lock
uv lock
```

## Key Rules

1. **Always** use conventional commits
2. **Never** commit without running checks
3. **Always** add type hints to functions
4. **Always** add reST docstrings to public functions
5. **Never** exceed 79 character line length
6. **Always** update uv.lock when adding dependencies
7. **Never** manually edit version numbers (use commitizen)

## Documentation Structure

```
docs/
├── rest-docstrings.md     # reST docstring guide
├── type-checking.md       # ty guide
├── versioning.md          # Commitizen guide
├── guides/                # How-to guides
└── changes/               # Change history
```

## Documentation Rules for AI Agents

**Root .md files**: ONLY README.md, CONTRIBUTING.md, LICENSE
**All other docs**: Must go in docs/ with proper subfolders
**Task-specific**: Create docs/{task-name}/ for complex work

## Testing

```bash
# Run all tests
pytest

# With coverage
pytest --cov

# Specific test
pytest test/test_example.py

# Verbose
pytest -v

# Stop on first failure
pytest -x
```

## Security Scans

```bash
# Both tools
make security

# Just bandit
bandit -c pyproject.toml -r src/

# Just safety
safety scan
```

## Type Checking

```bash
# Check all
ty check

# Show version
ty --version

# Check specific file
ty check src/template/example.py
```

## Quick Verification

Everything working:
```bash
make test && make lint && make typecheck && make docstyle
```

All checks passed = good to commit!
