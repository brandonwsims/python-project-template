# Python Project Template - Project Overview

## Last Updated

December 19, 2025

## Project Purpose

This is a comprehensive Python project template designed to provide a production-ready foundation for new Python projects. It incorporates modern tooling from the Astral ecosystem (uv, ruff, ty) along with best practices for testing, documentation, and version management.

## Target Audience

- Python developers starting new projects (libraries, CLI applications, web applications)
- Teams wanting a standardized, opinionated starting point
- Projects requiring Python 3.11+ with modern type checking and tooling
-
## Key Philosophy

1. **Astral Ecosystem First**: Leverage fast, Rust-based tools (uv, ruff, ty)
2. **Strict by Default**: Type checking, linting, docstring enforcement enabled
3. **Conventional Commits**: Automated versioning via commitizen
4. **Reproducible Builds**: uv.lock file for exact dependency versions
5. **Documentation**: reStructuredText (reST) format for Sphinx compatibility
6. **Security**: Built-in scanning with bandit and safety

## Project Structure

```
./
├── .copilot/                  # Project context for AI assistants
├── .github/workflows/          # CI/CD workflows
│   └── ci.yml                 # Multi-platform testing (Python 3.11-3.13)
├── docs/                      # All documentation (organized)
│   ├── rest-docstrings.md     # Conventional commits guide
│   ├── type-checking.md       # ty usage guide
│   ├── versioning.md          # Conventional commits guide
│   ├── guides/                # How-to guides and references
│   └── changes/               # Change history and summaries
├── src/template/              # Source code (src layout)
│   ├── __init__.py            # Package init with __version__
│   ├── example.py             # Example with reST docstrings
│   └── py.typed               # PEP 561 marker
├── test/                      # Test files (separate from src)
│   ├── __init__.py
│   ├── test_example.py
│   └── test_example_module.py
├── .editorconfig               # Editor consistency
├── .gitignore                 # Comprehensive Python gitignore
├── .pre-commit-config.yaml     # Pre-commit hooks configuration
├── .python-version            # Python 3.11
├── CONTRIBUTING.md            # Contribution guidelines
├── LICENSE                    # License
├── Makefile                    # Convenient command shortcuts
├── pyproject.toml             # Central configuration
├── README.md                  # Main documentation
└── uv.lock                    # Dependency lock file
```

## Technology Stack

### Core Tools (Astral Ecosystem)

- **uv** (latest): Package manager and virtual environment management
- **ruff** (v0.8.x): Linting and formatting (79 char line length)
- **ty** (v0.0.4): Type checking (Rust-based, Pyright-compatible)
-
### Testing & Quality

- **pytest** (v9.x): Testing framework
- **pytest-cov** (v7.x): Coverage reporting

### Security

- **bandit** (v1.8.x): Security linting
- **safety** (v3.x): Dependency vulnerability scanning

### Development

- **pre-commit** (v4.x): Git hooks for automated checks
- **commitizen** (v4.x): Conventional commits and version management
- **pydantic** (v2.x): Data validation (available but optional)

### Configuration

All tools configured in `pyproject.toml` following modern standards.

## Configuration Highlights

### pyproject.toml

- Python 3.11+ required
- Version constraints: `>=X.Y.Z,<NEXT_MAJOR.0.0`
- All dev dependencies with upper bounds to prevent breaking changes
- Comprehensive tool configurations (ruff, ty, pytest, bandit, pydocstyle, commitizen)

### Ruff Configuration

- Line length: 79 characters (PEP 8 strict)
- Target: Python 3.11
- Rule sets: E, W, F, I (isort), B, C4, UP, ARG, SIM, PL, RUF, D (pydocstyle)
- Relaxed rules for test files
- Format: double quotes, spaces, auto line endings

### Type Checking (ty)

- Configured to check src/ directory

### Testing (pytest)

- Test path: test/
- Coverage for src/template/
- Reports: terminal, HTML, XML
- Strict markers and config

### Docstrings (pydocstyle + ruff)

- Convention: PEP 257
- Format: reStructuredText (reST)
- Sphinx-compatible
- Enforced by both ruff (D rules) and pydocstyle

### Pre-commit Hooks

1. Trailing whitespace removal
2. End-of-file fixing
3. YAML validation
4. Large file checking
5. TOML validation
6. Merge conflict detection
7. Debug statement detection
8. Ruff linting (with auto-fix)
9. Ruff formatting
10. ty type checking
11. Bandit security scanning
12. Pytest execution
13. Commitizen commit message validation (commit-msg hook)

### Conventional Commits (commitizen)

- Format: `<type>[scope]: <description>`
- Types: feat, fix, docs, style, refactor, perf, test, build, ci, chore
- Version bumping: feat → MINOR, fix → PATCH, BREAKING CHANGE → MAJOR
- Auto-generates CHANGELOG.md
- Auto-creates git tags

## Makefile Commands
- `make install` - Install dev dependencies
- `make test` - Run pytest with coverage
- `make lint` - Run ruff linter
- `make format` - Format code with ruff
- `make typecheck` - Run ty type checking
- `make docstyle` - Check docstring style
- `make security` - Run bandit + safety
- `make bump` - Bump version (commitizen)
- `make changelog` - Generate CHANGELOG.md
- `make pre-commit` - Run all pre-commit hooks
- `make clean` - Remove build artifacts

## Version Management

Uses commitizen for semantic versioning:
- Analyzes conventional commit messages
- Automatically determines version bump
- Updates `pyproject.toml` and `src/template/__init__.py`
- Generates CHANGELOG.md from commits
- Creates annotated git tags

## Docstring Style

**Format**: reStructuredText (reST)

Example:

```python
def function_name(param: str) -> int:
    """Short one-line summary.
    Longer description if needed.
    :param param: Description of parameter.
    :type param: str
    :return: Description of return value.
    :rtype: int
    :raises ValueError: When this happens.
    :Example:
    >>> function_name("test")
    42
    """
    return 42
```

## Important Files
- **README.md**: Main documentation and quick start
- **CONTRIBUTING.md**: Detailed contribution guidelines with examples
- **pyproject.toml**: Central configuration for all tools
- **uv.lock**: Locked dependencies for reproducible builds
- **docs/**: All documentation organized in one place

## Common Workflows

### Adding Dependencies

```bash
uv pip install <package>
uv lock  # Update lock file
```

### Running All Checks

```bash
make pre-commit
```

## Design Decisions
1. **src/ layout**: Prevents accidental imports from working directory
2. **79 char line length**: PEP 8 strict compliance
3. **reST docstrings**: Sphinx compatibility and tool support
4. **Version constraints**: Prevent breaking changes from major updates
5. **uv.lock committed**: Reproducible builds across environments
6. **Pre-commit hooks**: Prevent bad code from being committed
7. **Conventional commits**: Enable automated versioning
8. **Astral tools**: Faster, modern, Rust-based performance

## Future Agent Context

When working on this project:
- Keep documentation **synchronized** with code
- Follow **conventional commits** for all changes
- Test changes by running `make test lint typecheck`
- Version is managed by **commitizen** (don't manually update)
- Lock file should be updated with: `uv lock`

## Documentation Organization for AI Agents

**CRITICAL GUIDELINES**: When creating documentation, especially completion summaries:

### Root Directory Rules

Only these markdown files belong in the root:
- `README.md` - Main project documentation
- `CONTRIBUTING.md` - Contribution guidelines
- `LICENSE` - Project license

### docs/ Organization

All other documentation must go in `docs/` with proper subfolder organization:

#### docs/ (main documentation)

Core reference documents:
- `rest-docstrings.md` - Docstring style guide
- `type-checking.md`, `versioning.md` - Development guides
- `versioning.md` - Versioning guide

#### docs/guides/ (how-to and references)

- Implementation guides
- Best practices documents
- Tutorial content
-
#### docs/changes/ (change history)

- Version update summaries
- Migration guides
- Change documentation
- Completion summaries from AI sessions

#### docs/{task-name}/ (task-specific)

For complex tasks, create dedicated subfolders:

```
docs/security-audit-2025-12/
├── README.md           # Overview
├── findings.md         # Results
├── decisions.md        # Design choices
├── implementation.md   # How it was done
└── testing.md          # Verification
```

### Guidelines for Creating Documentation

1. **Never create .md files in root** (except the 3 standard ones)
2. **Always use appropriate subfolder** based on content type
3. **Create task-specific folders** for complex work
4. **Use descriptive folder names** with dates (e.g., `performance-2025-12`)
5. **Organize by purpose** not document type

### Task-Specific Documentation Pattern

When completing a task:

```
docs/{task-name}/
├── README.md           # Summary and overview
├── decisions.md        # Why choices were made
├── implementation.md   # How it was implemented
├── testing.md          # Testing approach
└── migration.md        # How to adopt changes (if applicable)
```

### Common Task Folder Examples
- `docs/Jira-1234-feature-addition/` - Specific feature work
- `docs/Issue-5678-description/` - Github issue work
- `docs/security-audit-YYYY-MM/` - Security work
- `docs/performance-optimization-YYYY-MM/` - Performance improvements
- `docs/feature-{name}/` - New feature documentation
- `docs/refactor-{component}/` - Refactoring documentation
- `docs/upgrade-{tool}/` - Tool upgrade documentation

**REMEMBER**: Clean documentation structure makes the project professional and maintainable!
