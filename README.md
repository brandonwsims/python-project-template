# Python Project Template

A modern Python project template following best practices and PEP guidelines.

> **📝 Using this as a template?** See [TEMPLATE_USAGE.md](TEMPLATE_USAGE.md) for detailed instructions on how to create a new project from this template.

## Features

- 📦 **uv** for fast, reliable package management
- 🧪 **pytest** for testing
- 🔍 **mypy** for static type checking
- 🎨 **ruff** for linting and formatting (79 character line length)
- 🪝 **pre-commit** hooks for code quality
- 📁 **src/test** layout for clean project structure

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
- **mypy**: Strict type checking enabled
- **pytest**: Configured for src/test layout with coverage reporting

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

## License

[Choose your license]

## Contributing

1. Create a new branch for your feature
2. Make your changes
3. Run tests and ensure pre-commit hooks pass
4. Submit a pull request
