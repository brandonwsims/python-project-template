# Type Checking with ty

This project uses [ty](https://github.com/astral-sh/ty), a fast type checker from the Astral ecosystem (makers of uv and ruff).

## Why ty?

- **Fast**: Significantly faster than mypy
- **Modern**: Built with Rust for performance
- **Ecosystem**: Part of the uv/ruff toolchain
- **Strict**: Enforces type safety by default

## Configuration

Type checking is configured in `pyproject.toml`:

## Running Type Checks

### Command Line

```bash
# Check all files
ty check

# Check specific files
ty check src/mymodule.py

# Using make
make typecheck
```

### Pre-commit Hook

Type checking runs automatically on commit via pre-commit hooks.

### CI/CD

Type checking is part of the CI pipeline and must pass for PRs.

## Type Hints Best Practices

### Function Signatures

Always include type hints for function parameters and return values:

```python
def process_data(items: list[str], max_count: int = 10) -> dict[str, int]:
    """Process a list of items."""
    return {"processed": len(items[:max_count])}
```

### Variables

Type hints for variables are optional but recommended for clarity:

```python
# Explicit type hint
user_count: int = 0

# Type inference works well
items = []  # inferred as list[Any]
items: list[str] = []  # explicit type
```

### Complex Types

Use standard library types for Python 3.11+:

```python
# Modern approach (Python 3.11+)
def find_user(user_id: int) -> dict[str, str] | None:
    """Find a user by ID.

    :param user_id: The user's ID.
    :type user_id: int
    :return: User data dictionary or None if not found.
    :rtype: dict[str, str] | None
    """
    return None

# Collections
def process_batch(
    items: list[dict[str, int]],
    mapping: dict[str, list[str]]
) -> tuple[int, int]:
    """Process a batch of items.

    :param items: List of items to process.
    :type items: list[dict[str, int]]
    :param mapping: Mapping configuration.
    :type mapping: dict[str, list[str]]
    :return: Tuple of (processed_count, error_count).
    :rtype: tuple[int, int]
    """
    return (len(items), 0)
```

### Callables

```python
from collections.abc import Callable

def apply_transform(
    data: list[int],
    transform: Callable[[int], str]
) -> list[str]:
    """Apply a transformation to each item."""
    return [transform(x) for x in data]
```

### Generics

```python
from typing import TypeVar

T = TypeVar('T')

def first_item(items: list[T]) -> T | None:
    """Get the first item from a list."""
    return items[0] if items else None
```

### Classes

```python
class DataProcessor:
    """Process data with configurable options."""

    def __init__(self, max_size: int = 100) -> None:
        """Initialize the processor."""
        self.max_size: int = max_size
        self.processed: int = 0

    def process(self, data: list[str]) -> dict[str, int]:
        """Process the data."""
        self.processed += len(data)
        return {"count": len(data)}
```

### Pydantic Models

When using pydantic for data validation:

```python
from pydantic import BaseModel, Field

class User(BaseModel):
    """User model with validation."""

    id: int
    name: str
    email: str
    age: int | None = None
    roles: list[str] = Field(default_factory=list)
```

## Common Issues

### Missing Type Stubs

If you get errors about missing type stubs for third-party libraries:

```bash
# Install type stubs
uv pip install types-requests
```

### Type Ignores

Use `# type: ignore` sparingly and only when necessary:

```python
import some_untyped_library  # type: ignore
```

Better: Install type stubs or contribute them!

### Union Types

Use modern union syntax (Python 3.11+):

```python
# Good
def process(value: str | int) -> bool:
    return True

# Old style (avoid)
from typing import Union
def process(value: Union[str, int]) -> bool:
    return True
```

## Performance Tips

- ty is fast by default
- It only checks files that have changed
- Full project checks still take < 1 second for most projects

## Further Reading

- [ty GitHub Repository](https://github.com/astral-sh/ty)
- [Python Type Hints PEP 484](https://www.python.org/dev/peps/pep-0484/)
- [Python 3.11+ Type Features](https://docs.python.org/3/library/typing.html)
