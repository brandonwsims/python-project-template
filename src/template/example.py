"""Example module demonstrating proper structure and typing."""


def greet(name: str) -> str:
    """
    Generate a greeting message.

    Args:
        name: The name of the person to greet.

    Returns:
        A greeting message string.

    Examples:
        >>> greet("World")
        'Hello, World!'
    """
    return f"Hello, {name}!"


def add_numbers(a: int, b: int) -> int:
    """
    Add two numbers together.

    Args:
        a: First number.
        b: Second number.

    Returns:
        The sum of a and b.

    Examples:
        >>> add_numbers(2, 3)
        5
    """
    return a + b
