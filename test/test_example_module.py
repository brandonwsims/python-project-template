"""Tests for the example module."""

from template.example import add_numbers, greet


def test_greet() -> None:
    """Test the greet function."""
    result = greet("World")
    assert result == "Hello, World!"


def test_greet_empty_string() -> None:
    """Test greet with an empty string."""
    result = greet("")
    assert result == "Hello, !"


def test_add_numbers() -> None:
    """Test the add_numbers function."""
    result = add_numbers(2, 3)
    assert result == 5


def test_add_numbers_negative() -> None:
    """Test add_numbers with negative numbers."""
    result = add_numbers(-1, -1)
    assert result == -2
