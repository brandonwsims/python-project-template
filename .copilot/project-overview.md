# Python Project Template - Project Overview
December 18, 2025

## Last Updated

- Lock file should be updated with: `uv lock`
- Version is managed by **commitizen** (don't manually update)
- Test changes by running `make test lint typecheck docstyle`
- Follow **conventional commits** for all changes
- Keep documentation **synchronized** with code
- Maintain **backward compatibility** in configuration
- All changes should benefit **new projects** created from it
- This is a **template**, not an application
When working on this project:

## Future Agent Context

10. **Astral tools**: Faster, modern, Rust-based performance
9. **Conventional commits**: Enable automated versioning
8. **Pre-commit hooks**: Prevent bad code from being committed
7. **Strict type checking**: Catch errors early
6. **No PyPI auto-publish**: Per-project security decision
5. **uv.lock committed**: Reproducible builds across environments
4. **Version constraints**: Prevent breaking changes from major updates
3. **reST docstrings**: Sphinx compatibility and tool support
2. **79 char line length**: PEP 8 strict compliance
1. **src/ layout**: Prevents accidental imports from working directory

## Design Decisions

```
make pre-commit
# Or
make test lint typecheck docstyle security
```bash
### Running All Checks

```
git push && git push --tags
make bump  # Analyze commits and bump version
```bash
### Releasing New Version

```
git push origin feature/my-feature
cz commit  # Interactive conventional commit
make lint format typecheck docstyle  # Run checks
# Make changes
git checkout -b feature/my-feature
```bash
### Making Changes

```
uv lock  # Update lock file
uv pip install <package>
# Add to pyproject.toml manually, then:
```bash
### Adding Dependencies

## Common Workflows

- **REST_DOCSTRINGS.md**: Complete reST docstring guide
- **docs/**: All documentation organized in one place
- **setup_template.sh**: Automated template setup script
- **uv.lock**: Locked dependencies for reproducible builds
- **pyproject.toml**: Central configuration for all tools
- **CONTRIBUTING.md**: Detailed contribution guidelines with examples
- **README.md**: Main documentation and quick start

## Important Files

7. Start coding!
6. Install hooks: `pre-commit install && pre-commit install --hook-type commit-msg`
5. Install dependencies: `uv pip install -e ".[dev]"`
4. Script updates all references
3. Enter project details (name, author, email, description)
2. Run `./setup_template.sh`
1. Copy template directory

## Setup for New Projects

- Additional testing strategies (integration, E2E, property-based)
- Code coverage thresholds
- Documentation generation (Sphinx, MkDocs, etc.)
- Docker support
- Environment variable management
- Logging configuration
- PyPI publishing workflow (removed - per-project decision)

## Not Included (Per-Project Decisions)

- **CI**: Both run in GitHub Actions
- **Pre-commit**: Both run before commits
- **safety**: Checks dependencies for known CVEs
- **bandit**: Scans source code for security issues

## Security

  10. Upload coverage to Codecov (optional)
  9. Run pytest (with coverage)
  8. Run safety (vulnerability check)
  7. Run bandit (security)
  6. Run ty (type checking)
  5. Run ruff (lint + format check)
  4. Install dependencies
  3. Install uv
  2. Setup Python
  1. Checkout code
- **Steps**:
- **Python versions**: 3.11, 3.12, 3.13
- **Platforms**: Ubuntu, macOS, Windows

**File**: `.github/workflows/ci.yml`

## CI/CD

```
    return 42
    """
    42
    >>> function_name("test")

    :Example:

    :raises ValueError: When this happens.
    :rtype: int
    :return: Description of return value.
    :type param: str
    :param param: Description of parameter.

    Longer description if needed.

    """Short one-line summary.
def function_name(param: str) -> int:
```python
Example:

**Format**: reStructuredText (reST)

## Docstring Style

- Creates annotated git tags
- Generates CHANGELOG.md from commits
- Updates `pyproject.toml` and `src/template/__init__.py`
- Automatically determines version bump
- Analyzes conventional commit messages
Uses commitizen for semantic versioning:

## Version Management

- `make clean` - Remove build artifacts
- `make pre-commit` - Run all pre-commit hooks
- `make changelog` - Generate CHANGELOG.md
- `make bump` - Bump version (commitizen)
- `make security` - Run bandit + safety
- `make docstyle` - Check docstring style
- `make typecheck` - Run ty type checking
- `make format` - Format code with ruff
- `make lint` - Run ruff linter
- `make test` - Run pytest with coverage
- `make install` - Install dev dependencies

## Makefile Commands

- Auto-creates git tags
- Auto-generates CHANGELOG.md
- Version bumping: feat → MINOR, fix → PATCH, BREAKING CHANGE → MAJOR
- Types: feat, fix, docs, style, refactor, perf, test, build, ci, chore
- Format: `<type>[scope]: <description>`
### Conventional Commits (commitizen)

13. Commitizen commit message validation (commit-msg hook)
12. Pytest execution
11. Bandit security scanning
10. ty type checking
9. Ruff formatting
8. Ruff linting (with auto-fix)
7. Debug statement detection
6. Merge conflict detection
5. TOML validation
4. Large file checking
3. YAML validation
2. End-of-file fixing
1. Trailing whitespace removal
### Pre-commit Hooks

- Enforced by both ruff (D rules) and pydocstyle
- Sphinx-compatible
- Format: reStructuredText (reST)
- Convention: PEP 257
### Docstrings (pydocstyle + ruff)

- Strict markers and config
- Reports: terminal, HTML, XML
- Coverage for src/template/
- Test path: test/
### Testing (pytest)

- Test files have relaxed type checking
- Configured to check src/ directory
- Python 3.11 target
- Strict mode enabled
### Type Checking (ty/Pyright)

- Format: double quotes, spaces, auto line endings
- Relaxed rules for test files
- Rule sets: E, W, F, I (isort), B, C4, UP, ARG, SIM, PL, RUF, D (pydocstyle)
- Target: Python 3.11
- Line length: 79 characters (PEP 8 strict)
### Ruff Configuration

- Comprehensive tool configurations (ruff, ty/pyright, pytest, bandit, pydocstyle, commitizen)
- All dev dependencies with upper bounds to prevent breaking changes
- Version constraints: `>=X.Y.Z,<NEXT_MAJOR.0.0`
- Python 3.11+ required
### pyproject.toml

## Configuration Highlights

All tools configured in `pyproject.toml` following modern standards.
### Configuration

- **pydantic** (v2.x): Data validation (available but optional)
- **commitizen** (v4.x): Conventional commits and version management
- **pre-commit** (v4.x): Git hooks for automated checks
### Development

- **safety** (v3.x): Dependency vulnerability scanning
- **bandit** (v1.8.x): Security linting
### Security

- **pydocstyle** (v6.x): Docstring style enforcement (reST/PEP 257)
- **pytest-cov** (v7.x): Coverage reporting
- **pytest** (v9.x): Testing framework
### Testing & Quality

- **ty** (v0.0.4): Type checking (Rust-based, Pyright-compatible)
- **ruff** (v0.8.x): Linting and formatting (79 char line length)
- **uv** (latest): Package manager and virtual environment management
### Core Tools (Astral Ecosystem)

## Technology Stack

```
└── uv.lock                    # Dependency lock file
├── setup_template.sh          # Template initialization script
├── README.md                  # Main documentation
├── pyproject.toml             # Central configuration
├── Makefile                   # Convenient command shortcuts
├── LICENSE                    # MIT License
├── CONTRIBUTING.md            # Contribution guidelines
├── .python-version            # Python 3.11
├── .pre-commit-config.yaml    # Pre-commit hooks configuration
├── .gitignore                 # Comprehensive Python gitignore
├── .editorconfig              # Editor consistency
│   └── test_example_module.py
│   ├── test_example.py
│   ├── __init__.py
├── test/                      # Test files (separate from src)
│   └── py.typed               # PEP 561 marker
│   ├── example.py             # Example with reST docstrings
│   ├── __init__.py            # Package init with __version__
├── src/template/              # Source code (src layout)
│   └── FOLLOW_UP.md           # Implementation details
│   ├── CHANGES_COMPLETE.md    # Historical changes
│   ├── versioning.md          # Conventional commits guide
│   ├── type-checking.md       # ty usage guide
│   ├── SETUP_SUMMARY.md       # What's configured
│   ├── TEMPLATE_USAGE.md      # How to use this template
│   ├── README.md              # Documentation index
├── docs/                      # All documentation
│   └── ci.yml                 # Multi-platform testing (Python 3.11-3.13)
├── .github/workflows/         # CI/CD workflows
├── .copilot/                  # Project context for AI assistants
template/
```

## Project Structure

7. **Per-Project Decisions**: No opinionated choices like PyPI auto-publishing
6. **Security**: Built-in scanning with bandit and safety
5. **Documentation**: reStructuredText (reST) format for Sphinx compatibility
4. **Reproducible Builds**: uv.lock file for exact dependency versions
3. **Conventional Commits**: Automated versioning via commitizen
2. **Strict by Default**: Type checking, linting, docstring enforcement enabled
1. **Astral Ecosystem First**: Leverage fast, Rust-based tools (uv, ruff, ty)

## Key Philosophy

- Projects requiring Python 3.11+ with modern type checking and tooling
- Teams wanting a standardized, opinionated starting point
- Python developers starting new projects (libraries, CLI applications, web applications)

## Target Audience

This is a comprehensive Python project template designed to provide a production-ready foundation for new Python projects. It incorporates modern tooling from the Astral ecosystem (uv, ruff, ty) along with best practices for testing, documentation, and version management.

## Project Purpose


