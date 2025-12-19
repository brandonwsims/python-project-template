# .copilot - AI Assistant Context

This folder contains comprehensive project documentation specifically formatted for AI assistants (GitHub Copilot, ChatGPT, Claude, etc.) to quickly understand the project structure, decisions, and workflows.

## Purpose

Future AI sessions working on this project can read these files to gain complete context without needing extensive back-and-forth questions.

## Files

### project-overview.md
Complete project overview including:
- Project purpose and philosophy
- Technology stack with versions
- Project structure explanation
- Configuration highlights
- Common workflows
- Important files and their purposes

### quick-reference.md
Quick reference card with:
- Essential commands (Makefile targets)
- File locations
- Tool versions
- Configuration locations
- Commit types and version bumps
- reST docstring templates
- Common issues and solutions
- Quick verification steps

### architecture.md
Architectural decisions and rationale:
- Design principles
- Tool selection reasoning
- Configuration philosophy
- Strategy explanations
- Excluded patterns and why
- Future-proofing decisions

## Usage for AI Assistants

When starting a new session:
1. Read `project-overview.md` first for context
2. Reference `quick-reference.md` for commands and conventions
3. Consult `architecture.md` when making design decisions

## Documentation Organization Guidelines

**IMPORTANT**: When creating documentation, especially completion summaries:

### Standard Files in Root
Only these markdown files should remain in the root directory:
- `README.md` - Main project documentation
- `CONTRIBUTING.md` - Contribution guidelines
- `LICENSE` - Project license

### All Other Documentation Goes in docs/
Organize documentation into appropriate subfolders:

#### docs/ (main documentation)
- `README.md` - Documentation index
- `TEMPLATE_USAGE.md` - How to use this template
- `SETUP_SUMMARY.md` - What's configured
- `type-checking.md` - Type checking guide
- `versioning.md` - Version management guide
- Core reference documents

#### docs/guides/ (how-to guides and references)
- Style guides (e.g., `REST_DOCSTRINGS.md`)
- Implementation guides
- Best practices documents
- Tutorial content

#### docs/changes/ (change history and summaries)
- Version update summaries
- Migration guides
- Change documentation
- Completion summaries from AI sessions

#### docs/{task-name}/ (task-specific documentation)
When working on a specific task or feature, create a subfolder:
- `docs/security-audit/` - Security audit findings and recommendations
- `docs/performance-optimization/` - Performance improvement documentation
- `docs/api-redesign/` - API redesign proposals and decisions
- etc.

### Creating Task-Specific Documentation

When an AI agent completes a task, create documentation as follows:

```
docs/{task-name}/
├── README.md           # Overview of the task and changes
├── decisions.md        # Design decisions made
├── implementation.md   # Implementation details
├── testing.md          # Testing approach and results
└── migration.md        # Migration guide (if applicable)
```

**Example**: For a security audit task:
```
docs/security-audit-2025-12/
├── README.md           # Audit overview and summary
├── findings.md         # Security issues found
├── recommendations.md  # Recommended fixes
└── implementation.md   # How fixes were applied
```

### Guidelines for AI Agents

1. **Never create summary .md files in the root** - Use docs/changes/ or task-specific subfolder
2. **Organize by purpose** - guides/, changes/, or task-specific folders
3. **Create subfolders for complex tasks** - Group related documentation
4. **Update docs/README.md** - Add links to new documentation
5. **Use descriptive folder names** - Include dates for time-sensitive docs
6. **Keep it scannable** - Use clear hierarchy and navigation

## Last Updated

December 18, 2025

## Maintenance

These files should be updated whenever:
- Major architectural changes are made
- New tools are added or removed
- Configuration significantly changes
- New conventions are adopted
- Version bumps affect documented features

The documentation organization guidelines should be followed for all new documentation creation.

