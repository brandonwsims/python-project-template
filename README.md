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

- Python 3.10 or higher
- [uv](https://github.com/astral-sh/uv) installed

### Installation

1. Create a virtual environment:
   ```bash
   python -m venv .venv
   ```

2. Activate the virtual environment:
   ```bash
   # On macOS/Linux
   source .venv/bin/activate

   # On Windows
   .venv\Scripts\activate
   ```

3. Install dependencies using uv:
   ```bash
   uv pip install -e ".[dev]"
   ```

4. Install pre-commit hooks:
   ```bash
   pre-commit install
   ```

## Development

### Running Tests

```bash
pytest
```

### Type Checking

```bash
mypy src/
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
ruff check .

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

## Project Structure

```
.
├── src/                # Source code
│   └── __init__.py
├── test/               # Test files
│   └── __init__.py
├── .gitignore          # Git ignore patterns
├── .pre-commit-config.yaml  # Pre-commit configuration
├── pyproject.toml      # Project configuration
└── README.md           # This file
```

## Configuration

- **pyproject.toml**: Central configuration for project metadata, dependencies, and tools
- **ruff**: Configured for 79 character line length with comprehensive rule set
- **pyright**: Fast type checking with strict mode (Python 3.11+)
- **pytest**: Configured for src/test layout with coverage reporting
- **bandit**: Security linting for Python code
- **safety**: Dependency vulnerability scanning
- **pydantic**: Available for data validation (v2.x)
- **commitizen**: Conventional commits and version management

## Adding Dependencies

### Runtime Dependencies

```bash
# Add to pyproject.toml [project.dependencies]
uv pip install <package>
```

### Development Dependencies

```bash
# Add to pyproject.toml [project.optional-dependencies.dev]
uv pip install <package>
```

## Publishing to PyPI

This template is configured for PyPI distribution. To publish:

1. Update version in `pyproject.toml`
2. Update author name and email
3. Build the package:
   ```bash
   uv build
   ```
4. Publish to PyPI:
   ```bash
   uv publish
   ```

Or use the GitHub Actions workflow for automated publishing on releases.

## License

MIT License - See [LICENSE](LICENSE) file for details.

## Contributing

1. Read the [Contributing Guide](CONTRIBUTING.md)
2. Follow conventional commits format
3. Create a new branch for your feature
4. Make your changes with tests
5. Run quality checks: `make lint format typecheck security`
6. Commit using `cz commit` or conventional format
7. Push and submit a pull request

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.
