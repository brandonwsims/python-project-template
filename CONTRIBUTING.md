# Contributing to [Project Name]

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

## Code of Conduct

By participating in this project, you are expected to uphold our standards of respectful and professional conduct.

## How to Contribute

### Reporting Issues

- Check if the issue already exists in the issue tracker
- Use the issue template if available
- Provide a clear description and steps to reproduce
- Include relevant logs, error messages, and system information

### Submitting Changes

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** following our coding standards
3. **Add tests** for any new functionality
4. **Ensure all tests pass** by running `make test`
5. **Run code quality checks**: `make lint format typecheck security`
6. **Commit your changes** using conventional commits (see below)
7. **Push to your fork** and submit a pull request

## Conventional Commits

This project uses [Conventional Commits](https://www.conventionalcommits.org/) for commit messages. This enables automatic version bumping and changelog generation.

### Commit Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- **feat**: A new feature (triggers minor version bump)
- **fix**: A bug fix (triggers patch version bump)
- **docs**: Documentation only changes
- **style**: Changes that don't affect code meaning (formatting, etc.)
- **refactor**: Code changes that neither fix bugs nor add features
- **perf**: Performance improvements
- **test**: Adding or correcting tests
- **build**: Changes to build system or dependencies
- **ci**: Changes to CI configuration
- **chore**: Other changes that don't modify src or test files

### Breaking Changes

Add `BREAKING CHANGE:` in the commit footer or `!` after the type to trigger a major version bump:

```
feat!: remove deprecated API endpoint

BREAKING CHANGE: The /api/v1/old endpoint has been removed.
Use /api/v2/new instead.
```

### Examples

```bash
# Feature (minor version bump)
git commit -m "feat: add user authentication"

# Bug fix (patch version bump)
git commit -m "fix: resolve memory leak in data processor"

# Documentation
git commit -m "docs: update installation instructions"

# Breaking change (major version bump)
git commit -m "feat!: redesign API response format"
```

### Using Commitizen

This project includes commitizen to help create conventional commits:

```bash
# Interactive commit helper
cz commit

# Or use the alias
git cz
```

## Development Setup

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd <project-name>
   ```

2. **Create a virtual environment**:
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

3. **Install dependencies**:
   ```bash
   make install
   # or
   uv pip install -e ".[dev]"
   ```

4. **Install pre-commit hooks**:
   ```bash
   pre-commit install
   pre-commit install --hook-type commit-msg
   ```

## Development Workflow

### Running Tests

```bash
# Run all tests
make test

# Run specific test file
pytest test/test_specific.py

# Run with verbose output
pytest -v

# Run with coverage report
pytest --cov
```

### Code Quality

```bash
# Run all checks
make lint format typecheck security

# Or individually
make lint        # Ruff linting
make format      # Ruff formatting
make typecheck   # ty type checking
make security    # Bandit + Safety scans
```

### Pre-commit Hooks

Pre-commit hooks run automatically on `git commit`. They check:
- Trailing whitespace
- End of file fixing
- YAML/TOML validation
- Large files
- Merge conflicts
- Debug statements
- Ruff linting and formatting
- ty type checking
- Bandit security scanning
- Conventional commit format
- Tests

To run manually:
```bash
make pre-commit
# or
pre-commit run --all-files
```

## Version Management

This project uses [Commitizen](https://commitizen-tools.github.io/commitizen/) for automatic version bumping based on conventional commits.

### Bumping Version

```bash
# Automatically bump version based on commits
make bump

# Or manually specify the version part
cz bump --increment MAJOR
cz bump --increment MINOR
cz bump --increment PATCH
```

This will:
- Analyze commits since the last tag
- Determine the appropriate version bump
- Update version in all configured files
- Generate/update CHANGELOG.md
- Create a git tag
- Commit the changes

### Changelog

The changelog is automatically updated when bumping versions:

```bash
# Update changelog without bumping version
make changelog
```

## Pull Request Guidelines

1. **Update documentation** for any changed functionality
2. **Add tests** for new features or bug fixes
3. **Ensure all CI checks pass**
4. **Keep changes focused** - one feature/fix per PR
5. **Write a clear PR description** explaining what and why
6. **Link related issues** using "Closes #123" or "Fixes #123"
7. **Request review** from maintainers
8. **Be responsive** to feedback and questions

## Coding Standards

### Python Style

- **Line length**: 79 characters (enforced by ruff)
- **Import sorting**: Automatic via ruff (isort rules)
- **Type hints**: Required for all functions (enforced by ty)
- **Docstrings**: Required for public functions and classes
- **Testing**: Aim for >80% code coverage

### Code Organization

```
project/
├── src/
│   └── package/        # Source code
│       ├── __init__.py
│       └── ...
├── test/               # Test files
│   ├── __init__.py
│   └── test_*.py
└── docs/               # Documentation
```

### Type Hints

```python
def process_data(data: list[str], max_items: int = 10) -> dict[str, int]:
    """
    Process input data and return statistics.

    Args:
        data: List of strings to process
        max_items: Maximum number of items to process

    Returns:
        Dictionary with processing statistics
    """
    # Implementation
    return {"processed": len(data)}
```

### Docstrings

Use reStructuredText (reST) style docstrings following PEP 257:

```python
def calculate_sum(a: int, b: int) -> int:
    """Calculate the sum of two numbers.

    :param a: First number.
    :type a: int
    :param b: Second number.
    :type b: int
    :return: The sum of a and b.
    :rtype: int
    :raises ValueError: If inputs are not integers.

    :Example:

    >>> calculate_sum(2, 3)
    5
    """
    return a + b
```

## Security

- **Never commit sensitive data** (API keys, passwords, tokens)
- **Run security scans** before submitting: `make security`
- **Report security issues** privately to maintainers
- **Keep dependencies updated** and monitor vulnerability reports

## Getting Help

- Check existing [documentation](docs/)
- Search [closed issues](../../issues?q=is%3Aissue+is%3Aclosed)
- Ask in [discussions](../../discussions) (if enabled)
- Contact maintainers (see README.md)

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (MIT License).

---

Thank you for contributing! 🎉
