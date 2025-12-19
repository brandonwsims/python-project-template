# Python Project Template

A modern Python project template following best practices and PEP guidelines.

> **📝 Using this as a template?** See [docs/TEMPLATE_USAGE.md](docs/TEMPLATE_USAGE.md) for detailed instructions on how to create a new project from this template.

## Features

- 📦 **uv** for fast, reliable package management
- 🧪 **pytest** for testing with coverage
- ⚡ **ty** for blazing-fast type checking (Rust-based)
- 🎨 **ruff** for linting and formatting (79 character line length)
- 🔒 **bandit** for security scanning
- 🛡️ **safety** for dependency vulnerability checking
- 📊 **pydantic** for data validation
- 📝 **commitizen** for conventional commits and version management
- 🪝 **pre-commit** hooks for automated quality checks
- 📁 **src/test** layout for clean project structure
- 📄 **MIT License** included

## Setup

### Prerequisites

- Python 3.11 or higher
- [uv](https://github.com/astral-sh/uv) installed
- [make](https://makefiletutorial.com/) installed

### Installation

1. Create a virtual environment:
   ```bash
   # Defaults to .venv in the current directory
   uv venv

   # Or if you prefer a different name
   uv venv {name-of-venv}
   ```

2. Activate the virtual environment:
   ```bash
   # On macOS/Linux
   source .venv/bin/activate

   # On Windows
   .venv\Scripts\activate
   ```

3. Install dependencies:
   ```bash
   make install
   ```

## Development

### Running Tests

```bash
make test
```

### Type Checking

```bash
make typecheck
```

### Docstring Style Checking

```bash
make docstyle
```

### Security Scanning

```bash
# Run all security checks
make security

# Or run individually
bandit -c pyproject.toml -r src/
safety scan
```

### Linting and Formatting

```bash
# Check for issues
make lint

# Fix issues automatically
ruff check --fix .

# Format code
ruff format .
```

### Pre-commit Hooks

Pre-commit hooks will automatically run on `git commit`. To run manually:

```bash
pre-commit run --all-files
```

### Committing Changes
Use commitizen for conventional commits:

```bash
cz commit
```

### Release New Version

```bash
cz bump
```

### Update CHANGELOG

```bash
cz changelog
```

## Project Structure

```
.
├── src/                    # Source code
│   └── __init__.py
├── test/                   # Test files
│   └── __init__.py
└── pyproject.toml          # Project configuration
```

## Configuration

- **pyproject.toml**: Central configuration for project metadata, dependencies, and tools
- **ruff**: Configured for [79 character line length](https://peps.python.org/pep-0008/#maximum-line-length) with comprehensive rule set including pydocstyle
- **ty**: Fast type checking with strict mode (Python 3.11+, Rust-based from Astral)
- **pydocstyle**: Enforces reStructuredText (reST) docstring format (PEP 257)
- **pytest**: Configured for src/test layout with coverage reporting
- **bandit**: Security linting for Python code
- **safety**: Dependency vulnerability scanning
- **pydantic**: Available for data validation (v2.x)
- **commitizen**: Conventional commits and version management

## Adding Dependencies

### Runtime Dependencies

```bash
# Add to pyproject.toml [project.dependencies]
uv add <package>

# Update lock file
uv lock
```

### Development Dependencies

```bash
# Add to pyproject.toml [project.optional-dependencies.dev]
uv add --dev <package>

# Update lock file
uv lock
```


## License

MIT License - See [LICENSE](LICENSE) file for details.

## Contributing

1. Read the [Contributing Guide](CONTRIBUTING.md)
2. Follow conventional commits format
3. Create a new branch for your feature
4. Make your changes with tests
5. Run quality checks: `make lint format typecheck docstyle security`
6. Commit using `cz commit` or conventional format
7. Push and submit a pull request

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.
