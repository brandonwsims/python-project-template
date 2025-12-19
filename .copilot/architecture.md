# Architecture & Design Decisions

## Core Principles

### 1. Astral Ecosystem Integration
**Decision**: Use uv, ruff, and ty as core tools
**Rationale**:
- Rust-based = significantly faster than Python-based alternatives
- Maintained by same team = consistent experience
- Modern architecture = better Python 3.11+ support
- Growing adoption = future-proof choice

### 2. Strict Configuration by Default
**Decision**: Enable strict type checking, comprehensive linting, docstring enforcement
**Rationale**:
- Catch errors early in development
- Enforce code quality standards
- Make relaxing rules easier than enforcing them
- Professional-grade output from day one

### 3. src/ Layout
**Decision**: Use `src/package/` instead of flat `package/` layout
**Rationale**:
- Prevents accidental imports from CWD during development
- Forces proper package installation for testing
- Widely considered best practice
- Better for distribution

### 4. 79 Character Line Length
**Decision**: Strict 79-char limit (not 88, 100, or 120)
**Rationale**:
- PEP 8 official recommendation
- Works well with side-by-side diffs
- Encourages better code structure
- Consistency across all Python projects

### 5. reStructuredText Docstrings
**Decision**: Enforce reST format, not Google/NumPy style
**Rationale**:
- Sphinx standard (de facto Python doc generator)
- Better tool support (pydocstyle, IDEs)
- Explicit type information
- Works with doctest
- Industry standard for Python libraries

### 6. Conventional Commits Required
**Decision**: Enforce via pre-commit hook
**Rationale**:
- Enables automated semantic versioning
- Auto-generates meaningful changelogs
- Clear intent in git history
- Standard practice in modern projects

### 7. Version Constraints with Upper Bounds
**Decision**: Use `>=X.Y.Z,<NEXT_MAJOR.0.0` format
**Rationale**:
- Prevents breaking changes from major updates
- Allows bug fixes and minor features
- Reduces dependency hell
- Explicit about compatibility

### 8. Lock File Committed
**Decision**: Commit `uv.lock` to repository
**Rationale**:
- Reproducible builds across machines
- Consistent CI/CD environments
- Easy to track dependency changes
- Standard for applications (less important for libraries)

### 9. Separate test/ Directory
**Decision**: `test/` separate from `src/`, not `src/package/tests/`
**Rationale**:
- Tests aren't part of the package
- Reduces package size when distributed
- Clear separation of concerns
- Common practice

## Tool Selections

### Why ty over mypy?
- **Performance**: 10-100x faster (Rust vs Python)
- **Ecosystem**: Part of uv/ruff/ty stack
- **Modern**: Built for Python 3.11+ from ground up
- **Maintenance**: Actively developed by Astral
- **Future**: Likely to become standard

### Why ruff over pylint/flake8?
- **Performance**: 10-100x faster
- **Comprehensive**: Replaces multiple tools
- **Modern**: Better Python 3.11+ support
- **Integrated**: isort, pyupgrade, and more built-in
- **Adoption**: Rapidly becoming industry standard

### Why pytest over unittest?
- **More Pythonic**: Simpler assert statements
- **Better fixtures**: Powerful dependency injection
- **Plugins**: Rich ecosystem
- **Industry standard**: Most popular Python test framework

### Why commitizen over manual versioning?
- **Automation**: No human error in version numbers
- **Consistency**: Forced conventional commits
- **Changelog**: Auto-generated from commits
- **Integration**: Works with CI/CD

### Why pydocstyle over custom checks?
- **Standards**: Enforces PEP 257
- **Integration**: Works with ruff
- **Flexible**: Configurable conventions
- **Established**: Mature, stable tool

### Why bandit over custom security checks?
- **Comprehensive**: Checks many vulnerability patterns
- **Maintained**: Regular updates
- **Standard**: Industry recognition
- **AST-based**: Accurate analysis

### Why safety over manual CVE checking?
- **Database**: Continuously updated vulnerability DB
- **Automation**: Easy CI integration
- **Reporting**: Clear vulnerability information
- **Free tier**: Usable for open source

## Configuration Philosophy

### Central Configuration (pyproject.toml)
**Decision**: All tool config in one file
**Rationale**:
- Single source of truth
- PEP 518/621 standard
- Easier maintenance
- Better discoverability

### Minimal .gitignore
**Decision**: Comprehensive but standard Python gitignore
**Rationale**:
- Covers common scenarios
- OS-specific files excluded
- Tool artifacts excluded
- Virtual environments excluded

### EditorConfig Included
**Decision**: Add .editorconfig for consistency
**Rationale**:
- Works across IDEs
- Enforces basic formatting
- Independent of language tools
- Low-cost high-value

## Pre-commit Hook Strategy

### What's Included
1. **File Cleaners**: Trailing whitespace, EOF
2. **Format Validators**: YAML, TOML
3. **Safety Checks**: Large files, merge conflicts
4. **Code Quality**: ruff (lint + format), ty (types)
5. **Security**: bandit
6. **Tests**: pytest
7. **Commit Messages**: commitizen

### What's Excluded
- safety (too slow for pre-commit)
- Heavy linting (covered by ruff)

### Rationale
- Fast enough to not annoy developers
- Comprehensive enough to catch issues
- Can be bypassed with --no-verify if needed
- Runs in CI as backup

## CI/CD Strategy

### Multi-Platform Testing
**Decision**: Test on Ubuntu, macOS, Windows
**Rationale**:
- Python behavior varies by OS
- Path handling differences
- Line ending differences
- Dependency build issues

### Multi-Version Testing
**Decision**: Test on 3.11, 3.12, 3.13
**Rationale**:
- Support current + future Python
- Catch version-specific issues
- Ensure compatibility
- Follow Python support cycle

## Security Decisions

### Bandit Configuration
- **Exclude tests**: Intentional in testing
- **Skip B101**: assert is fine in tests
- **Scan src only**: Production code matters most

### Safety Configuration
- **Best effort**: Continue on failure
- **JSON output**: For CI parsing
- **Latest DB**: Always check current vulns

### No Credentials in Template
- **No API tokens**: User-provided
- **No .env example**: Project-specific

## Development Experience

### Makefile Over Scripts
**Decision**: Use Makefile for common commands
**Rationale**:
- Universal (works everywhere)
- Self-documenting (make help)
- Familiar to developers
- Simple syntax

## Documentation Strategy

### Organized in docs/
**Decision**: All docs in dedicated folder
**Rationale**:
- Clear separation
- Easy navigation
- Scalable
- Professional

### Multiple Reference Docs
**Decision**: Keep historical change docs
**Rationale**:
- Context for decisions
- Migration guides
- Learning resource
- Audit trail

### .copilot/ for AI Context
**Decision**: Add dedicated AI assistant context
**Rationale**:
- Helps future AI sessions
- Quick onboarding
- Architectural memory
- Best practices documentation

## Type System Decisions

### py.typed Marker
**Decision**: Include PEP 561 marker
**Rationale**:
- Distributes type information
- IDE integration
- Standard practice
- No cost

### Test Type Relaxation
**Decision**: Relax type checks in tests
**Rationale**:
- Tests have different needs
- Mock objects complicate types
- Less critical than production code
- Reduces friction

## Dependency Management

### Use uv Only
**Decision**: No poetry/pipenv
**Rationale**:
- Performance
- Simplicity
- Modern features
- Growing ecosystem
- Less overhead
- Single tool for everything

## Future-Proofing

### Python 3.11+ Only
**Decision**: No Python 3.10 or older support
**Rationale**:
- Modern type hint syntax
- Better performance
- Simplified codebase
- Python 3.10 EOL approaching

### Upper Bounds on Dependencies
**Decision**: Prevent next major version
**Rationale**:
- Protects against breaking changes
- Explicit compatibility
- Easy to update when ready
- Industry best practice

### Semantic Versioning
**Decision**: Follow SemVer strictly
**Rationale**:
- Clear upgrade path
- Predictable compatibility
- Standard practice
- Automated via commitizen

## Summary

This template is opinionated where it matters (tooling, standards) and flexible where it should be (project specifics). Every decision is made to provide the best starting point for professional Python projects in 2025 and beyond.
