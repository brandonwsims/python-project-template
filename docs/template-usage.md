# Using This Template

This document explains how to use this Python project template to create new projects.

## Manual Setup

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

### Step 6: Initialize Your Project

```bash
# Remove old git history
rm -rf .git

# Create virtual environment (if not already created)
uv venv

# Activate virtual environment
source .venv/bin/activate  # On macOS/Linux
# or
.venv\Scripts\activate  # On Windows

# Install dependencies
make install

# Initialize new git repository
git init

# Make first commit
git add -A
git commit -m "Initial commit"
```

## Customizing Your Project

### Adding Dependencies

#### Runtime Dependencies
1. `uv add package_name`
2. `uv lock`

#### Development Dependencies
1. `uv add --dev package_name`
2. `uv lock`

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
└── ...
```

## Best Practices

1. **Always activate your virtual environment** before running commands
2. **Use conventional commits**: `cz commit` or follow the format manually
3. **Run tests before committing**: `make test`
4. **Pre-commit hooks will run automatically** on `git commit`
5. **Follow PEP 8** with 79 character line length (enforced by ruff)
6. **Add type hints** to all functions (enforced by ty)
7. **Write reST docstrings** for all public functions and classes (enforced by pydocstyle pep257)
8. **Keep test coverage high** - aim for >80%
9. **Update uv.lock** when adding dependencies: `uv lock`
10. **Use make commands** for consistency

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
