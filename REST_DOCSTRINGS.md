# reStructuredText Docstring Enforcement

## ✅ Changes Completed

### Enforced reStructuredText (reST) Docstring Style

The template now enforces reStructuredText docstring format following PEP 257.

## What Was Added

### 1. Pydocstyle Tool
- **Added**: `pydocstyle>=6.3.0,<7.0.0` to dev dependencies
- **Purpose**: Checks docstring style compliance
- **Command**: `make docstyle` or `pydocstyle src/`

### 2. Ruff Docstring Rules
- **Enabled**: "D" rule set in ruff (pydocstyle rules)
- **Convention**: PEP 257 with reST format
- **Ignored**: D203, D213 (conflicting rules)

### 3. Configuration in pyproject.toml

```toml
[tool.ruff.lint]
select = [
    # ...existing rules...
    "D",     # pydocstyle
]
ignore = [
    # ...existing ignores...
    "D203",  # 1 blank line required before class docstring (conflicts with D211)
    "D213",  # Multi-line docstring summary should start at the second line (conflicts with D212)
]

[tool.ruff.lint.pydocstyle]
convention = "pep257"

[tool.pydocstyle]
convention = "pep257"
add-ignore = ["D203", "D213"]
match = "(?!test_).*\\.py"
match-dir = "^(?!(\\.venv|test|__pycache__|build|dist)).*"
```

## reStructuredText Docstring Format

### Standard Format

```python
def function_name(param1: type1, param2: type2) -> return_type:
    """Short one-line summary.

    Longer description if needed. Can span multiple lines.

    :param param1: Description of param1.
    :type param1: type1
    :param param2: Description of param2.
    :type param2: type2
    :return: Description of return value.
    :rtype: return_type
    :raises ExceptionType: When this exception is raised.

    :Example:

    >>> function_name(arg1, arg2)
    result
    """
    # Implementation
```

### Key Elements

1. **Summary**: One-line description (period at end)
2. **Description**: Optional longer description (blank line after summary)
3. **:param**: Parameter descriptions with `:type` on next line
4. **:return**: Return value description with `:rtype` on next line
5. **:raises**: Exceptions that can be raised (optional)
6. **:Example:**: Usage examples with doctests (optional)

### Example from template

```python
def greet(name: str) -> str:
    """Generate a greeting message.

    :param name: The name of the person to greet.
    :type name: str
    :return: A greeting message string.
    :rtype: str

    :Example:

    >>> greet("World")
    'Hello, World!'
    """
    return f"Hello, {name}!"
```

## Benefits of reST Format

1. **Sphinx Compatible**: Works seamlessly with Sphinx documentation generator
2. **IDE Support**: Better IntelliSense/autocomplete in PyCharm and VS Code
3. **Standard**: Widely used in Python ecosystem
4. **Tool Support**: Supported by pydocstyle, Sphinx, and many documentation tools
5. **Type Information**: Explicit type information in docstrings

## Usage

### Check Docstring Style

```bash
# Using pydocstyle directly
pydocstyle src/

# Using make
make docstyle

# Using ruff (includes docstring checks)
ruff check .
```

### Example Output

When docstrings are correct:
```
$ pydocstyle src/
$ # No output = all checks passed
```

When there are issues:
```
$ pydocstyle src/module.py
src/module.py:1 in public module
    D100: Missing docstring in public module
src/module.py:5 in public function `my_function`
    D103: Missing docstring in public function
```

## Files Updated

1. **pyproject.toml** - Added pydocstyle to dependencies and configuration
2. **src/template/example.py** - Updated with reST docstrings
3. **CONTRIBUTING.md** - Updated docstring examples to reST format
4. **docs/type-checking.md** - Updated examples to reST format
5. **README.md** - Added docstring style section
6. **Makefile** - Added `docstyle` target

## Verification

All checks passing:
```
✅ pytest: 6/6 tests (100% coverage)
✅ ruff: All checks passed (including docstring rules)
✅ ty: All checks passed
✅ pydocstyle: No issues found
```

## Integration

Docstring checks are now part of the quality assurance pipeline:
- **Ruff**: Checks docstrings during linting (`make lint`)
- **Pydocstyle**: Dedicated docstring checker (`make docstyle`)
- **Pre-commit**: Can be added to hooks if desired
- **CI/CD**: Runs as part of CI checks

## Developer Workflow

When writing code:
1. Write function/class with type hints
2. Add reST docstring with `:param:`, `:return:`, etc.
3. Run `make lint` and `make docstyle` to verify
4. Commit with confidence that docs are properly formatted

---

**reStructuredText docstring style is now enforced throughout the template!** 📚

