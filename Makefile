.PHONY: help install test lint format typecheck clean pre-commit

help:
	@echo "Available commands:"
	@echo "  make install     - Install development dependencies"
	@echo "  make test        - Run tests with pytest"
	@echo "  make lint        - Run ruff linter"
	@echo "  make format      - Format code with ruff"
	@echo "  make typecheck   - Run mypy type checker"
	@echo "  make pre-commit  - Run pre-commit hooks on all files"
	@echo "  make clean       - Remove build artifacts and cache"

install:
	uv pip install -e ".[dev]"
	pre-commit install

test:
	pytest

lint:
	ruff check .

format:
	ruff format .
	ruff check --fix .

typecheck:
	mypy src/template/

pre-commit:
	pre-commit run --all-files

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf .pytest_cache/
	rm -rf .mypy_cache/
	rm -rf .ruff_cache/
	rm -rf htmlcov/
	rm -rf .coverage
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
