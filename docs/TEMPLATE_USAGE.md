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
2. **Use conventional commits**: `cz commit` or follow the format manually
3. **Run tests before committing**: `make test`
4. **Pre-commit hooks will run automatically** on `git commit`
5. **Follow PEP 8** with 79 character line length (enforced by ruff)
6. **Add type hints** to all functions (enforced by ty)
7. **Write reST docstrings** for all public functions and classes
8. **Keep test coverage high** - aim for >80%
9. **Update uv.lock** when adding dependencies: `uv lock`
10. **Use make commands** for consistency

## Troubleshooting

### Pre-commit hooks fail

```bash
# Run hooks manually to see details
pre-commit run --all-files

# Update pre-commit hooks
pre-commit autoupdate

# Install commit-msg hook if missing
pre-commit install --hook-type commit-msg
```

### Import errors in tests

- Ensure you've installed the package: `uv pip install -e ".[dev]"`
- Ensure you're using the correct virtual environment: `which python`
- Check that package name matches in all files

### Type checking issues

- Make sure all functions have return type annotations
- Use proper type hints for Python 3.11+ (e.g., `list[str]` not `List[str]`)
- Check `ty check` output for specific errors

### Docstring style errors

- Ensure docstrings follow reST format (see `src/template/example.py` for examples)
- Run `pydocstyle src/` to see specific issues
- See `docs/guides/REST_DOCSTRINGS.md` for complete guide

## Template Features

✅ **uv** (latest) - Fast package management with lock file
✅ **pytest** (v9.x) - Testing with coverage
✅ **ty** (v0.0.4) - Blazing-fast type checking (Rust-based)
✅ **ruff** (v0.8.x) - Linting and formatting (79 char line length)
✅ **pydocstyle** (v6.x) - reStructuredText docstring enforcement
✅ **bandit** (v1.8.x) - Security scanning
✅ **safety** (v3.x) - Dependency vulnerability checking
✅ **pydantic** (v2.x) - Data validation (available)
✅ **commitizen** (v4.x) - Conventional commits and version management
✅ **pre-commit** (v4.x) - Automated quality checks
✅ **src/test layout** - Clean project structure
✅ **PEP-compliant** - Follows Python standards

## Additional Considerations

When starting a new project, you might also want to:

1. **Choose or update license** - Verify LICENSE file is appropriate
2. **Update README.md** - Add project-specific information
3. **Configure CI/CD** - Update `.github/workflows/ci.yml` if needed
4. **Add project-specific tools** - Documentation generators, APIs, etc.
5. **Set up version control hosting** - GitHub, GitLab, Bitbucket
6. **Configure issue templates** - For bug reports and feature requests
7. **Add security policy** - SECURITY.md for vulnerability reporting
8. **Set up documentation** - Sphinx, MkDocs, etc.
9. **Configure monitoring** - Error tracking, performance monitoring
10. **Set up dependency updates** - Dependabot, Renovate

## Questions or Issues?

If you encounter any problems with this template, please review:

1. The main README.md
2. Documentation in `docs/`
3. Tool documentation:
   - [uv](https://github.com/astral-sh/uv)
   - [ruff](https://docs.astral.sh/ruff/)
   - [ty](https://github.com/astral-sh/ty)
   - [pytest](https://docs.pytest.org/)
   - [pre-commit](https://pre-commit.com/)
   - [commitizen](https://commitizen-tools.github.io/commitizen/)
   - [pydocstyle](http://www.pydocstyle.org/)

## Next Steps

After setup:

1. Review and customize `README.md` for your project
2. Update `CONTRIBUTING.md` with project-specific guidelines
3. Start adding your code to `src/your_project_name/`
4. Write tests in `test/`
5. Use `cz commit` for all commits
6. Run `make bump` when ready to release a new version
7. Keep `docs/` updated with project documentation
