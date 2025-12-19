# Using This Template

This document explains how to use this Python project template to create new projects.

## Method 1: Using the Setup Script (Recommended)

The easiest way to use this template is with the provided setup script:

```bash
# 1. Copy this template directory to your new project location
cp -r template /path/to/your-new-project
cd /path/to/your-new-project

# 2. Run the setup script
./setup_template.sh

# 3. Follow the prompts and enter your project name
```

The script will automatically:
- Update all references from "template" to your project name
- Rename the package directory
- Update import statements in tests
- Configure build settings
- Remove the old git repository

Then follow the "Next steps" instructions printed by the script.

## Method 2: Manual Setup

If you prefer to set things up manually:

### Step 1: Copy Template
```bash
cp -r template /path/to/your-new-project
cd /path/to/your-new-project
```

### Step 2: Update Project Configuration

Edit `pyproject.toml` and update:
- `name = "template"` → `name = "your_project_name"`
- `packages = ["src/template"]` → `packages = ["src/your_project_name"]`
- `--cov=template` → `--cov=your_project_name`

### Step 3: Rename Package Directory
```bash
mv src/template src/your_project_name
```

### Step 4: Update Test Imports

In all test files (`test/*.py`), update:
- `from template.` → `from your_project_name.`
- `import template` → `import your_project_name`

### Step 5: Update Makefile

Change `mypy src/template/` to `mypy src/your_project_name/`

### Step 6: Initialize Your Project

```bash
# Remove old git history
rm -rf .git

# Create virtual environment (if not already created)
python -m venv .venv

# Activate virtual environment
source .venv/bin/activate  # On macOS/Linux
# or
.venv\Scripts\activate  # On Windows

# Install dependencies
uv pip install -e ".[dev]"

# Initialize new git repository
git init

# Install pre-commit hooks
pre-commit install

# Make first commit
git add -A
git commit -m "Initial commit"
```

## Customizing Your Project

### Adding Dependencies

#### Runtime Dependencies
1. Add the package name to `dependencies` in `pyproject.toml`
2. Run: `uv pip install -e ".[dev]"`

#### Development Dependencies
1. Add the package name to `dev` in `[project.optional-dependencies]` in `pyproject.toml`
2. Run: `uv pip install -e ".[dev]"`

### Project Structure

```
your_project/
├── src/
│   └── your_project_name/    # Your main package
│       ├── __init__.py
│       └── ...               # Your modules
├── test/                     # Test files
│   ├── __init__.py
│   └── test_*.py            # Test modules
├── pyproject.toml           # Project configuration
├── README.md                # Project documentation
├── .gitignore              # Git ignore patterns
├── .pre-commit-config.yaml # Pre-commit hooks
├── Makefile                # Common commands
└── ...
```

### Configuration Files

- **pyproject.toml**: Central configuration for project metadata, dependencies, and all tools
- **ruff**: Linting and formatting (79 character line length)
- **mypy**: Type checking with strict settings
- **pytest**: Testing with coverage reports
- **pre-commit**: Automated code quality checks

### Common Commands

Using Make:
```bash
make help        # Show available commands
make install     # Install dependencies
make test        # Run tests
make lint        # Run linter
make format      # Format code
make typecheck   # Run type checker
make pre-commit  # Run all pre-commit hooks
make clean       # Remove build artifacts
```

Using tools directly:
```bash
# Testing
pytest
pytest -v
pytest test/test_specific.py

# Linting
ruff check .
ruff check --fix .

# Formatting
ruff format .

# Type checking
mypy src/your_project_name/

# Pre-commit
pre-commit run --all-files
```

## Best Practices

1. **Always activate your virtual environment** before running commands
2. **Run tests before committing**: `pytest`
3. **Pre-commit hooks will run automatically** on `git commit`
4. **Follow PEP 8** and the configured ruff rules
5. **Add type hints** to all functions (mypy enforces this)
6. **Write docstrings** for all public functions and classes
7. **Keep test coverage high** - aim for >80%

## Troubleshooting

### Pre-commit hooks fail
```bash
# Run hooks manually to see details
pre-commit run --all-files

# Update pre-commit hooks
pre-commit autoupdate
```

### Import errors in tests
- Ensure you've installed the package in editable mode: `uv pip install -e ".[dev]"`
- Ensure you're using the correct virtual environment

### Type checking issues
- Make sure all functions have return type annotations
- Use `# type: ignore` comments sparingly and only when necessary

## Template Features

✅ **uv** for fast package management
✅ **src/test layout** for clean structure
✅ **pytest** with coverage reporting
✅ **ruff** for linting and formatting (79 char line length)
✅ **mypy** with strict type checking
✅ **pre-commit hooks** for automated quality checks
✅ **Comprehensive .gitignore**
✅ **Makefile** for common tasks
✅ **PEP-compliant** configuration

## Additional Considerations

When starting a new project, you might also want to:

1. **Choose a license** - Update or create a LICENSE file
2. **Update README.md** - Add project-specific information
3. **Configure CI/CD** - A GitHub Actions workflow is included in `.github/workflows/ci.yml`. Update the `mypy src/` command to `mypy src/your_project_name/` in the workflow file. For GitLab CI or other platforms, adapt as needed.
4. **Add project-specific tools** - Documentation generators, etc.
5. **Set up version control hosting** - GitHub, GitLab, Bitbucket
6. **Configure issue templates** - For bug reports and feature requests
7. **Add contributing guidelines** - CONTRIBUTING.md
8. **Set up documentation** - Sphinx, MkDocs, etc.

## Questions or Issues?

If you encounter any problems with this template, please review:
1. The main README.md
2. Tool documentation:
   - [uv](https://github.com/astral-sh/uv)
   - [ruff](https://docs.astral.sh/ruff/)
   - [mypy](https://mypy.readthedocs.io/)
   - [pytest](https://docs.pytest.org/)
   - [pre-commit](https://pre-commit.com/)
