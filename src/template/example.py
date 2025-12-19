"""Example module demonstrating proper structure and typing."""


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


def add_numbers(a: int, b: int) -> int:
    """Add two numbers together.

    :param a: First number.
    :type a: int
    :param b: Second number.
    :type b: int
    :return: The sum of a and b.
    :rtype: int

    :Example:

    >>> add_numbers(2, 3)
    5
    """
    return a + b
