#!/usr/bin/env bash

# Template Setup Script
# This script helps initialize a new project from this template

set -e

echo "🚀 Python Project Template Setup"
echo "================================="
echo ""

# Get project name from user
read -p "Enter your project name (e.g., my_project): " PROJECT_NAME

if [ -z "$PROJECT_NAME" ]; then
    echo "❌ Project name cannot be empty"
    exit 1
fi

# Validate project name (lowercase, underscores, alphanumeric)
if ! [[ "$PROJECT_NAME" =~ ^[a-z][a-z0-9_]*$ ]]; then
    echo "❌ Project name must start with a letter and contain only lowercase letters, numbers, and underscores"
    exit 1
fi

echo ""
echo "📝 Project name: $PROJECT_NAME"
echo ""

# Update project name in pyproject.toml
echo "📦 Updating pyproject.toml..."
sed -i.bak "s/name = \"template\"/name = \"$PROJECT_NAME\"/" pyproject.toml
sed -i.bak "s/Your Name/$AUTHOR_NAME/g" pyproject.toml
sed -i.bak "s/your.email@example.com/$AUTHOR_EMAIL/g" pyproject.toml
sed -i.bak "s/A template Python project/$PROJECT_DESC/" pyproject.toml
rm pyproject.toml.bak

# Update LICENSE file
echo "📄 Updating LICENSE..."
sed -i.bak "s/\[Your Name\]/$AUTHOR_NAME/" LICENSE
rm LICENSE.bak

# Rename src/template to src/$PROJECT_NAME
echo "📁 Renaming package directory..."
mv src/template "src/$PROJECT_NAME"

# Update imports in test files
echo "🔧 Updating test imports..."
find test -name "*.py" -type f -exec sed -i.bak "s/from template\./from $PROJECT_NAME./g" {} \;
find test -name "*.py" -type f -exec sed -i.bak "s/import template/import $PROJECT_NAME/g" {} \;
find test -name "*.py.bak" -type f -delete

# Update pyproject.toml package path
sed -i.bak "s/packages = \[\"src\/template\"\]/packages = [\"src\/$PROJECT_NAME\"]/" pyproject.toml
sed -i.bak "s/--cov=template/--cov=$PROJECT_NAME/" pyproject.toml
rm pyproject.toml.bak

# Update Makefile
sed -i.bak "s/mypy src\/template\//mypy src\/$PROJECT_NAME\//" Makefile
rm Makefile.bak

# Update GitHub Actions workflow if it exists
if [ -f ".github/workflows/ci.yml" ]; then
    echo "🔧 Updating GitHub Actions workflow..."
    sed -i.bak "s/mypy src\//mypy src\/$PROJECT_NAME\//" .github/workflows/ci.yml
    rm .github/workflows/ci.yml.bak
fi

# Clean up git if exists
if [ -d ".git" ]; then
    echo "🗑️  Removing existing git repository..."
    rm -rf .git
fi

echo ""
echo "✅ Template setup complete!"
echo ""
echo "Next steps:"
echo "1. Create a virtual environment: python -m venv .venv"
echo "2. Activate it: source .venv/bin/activate"
echo "3. Install dependencies: uv pip install -e \".[dev]\""
echo "4. Initialize git: git init"
echo "5. Install pre-commit: pre-commit install"
echo "6. Make your first commit: git add -A && git commit -m \"Initial commit\""
echo ""
echo "Happy coding! 🎉"
