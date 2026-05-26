# AGENTS.md Template

<!--
HOW TO USE THIS TEMPLATE
========================

This file is a starting point for AGENTS.md — the machine-readable project guide that
helps AI coding assistants work effectively in your codebase.

CRITICAL PRINCIPLE: Only document what the agent CANNOT infer from reading the code.

DO include:
  - Commands and their non-obvious flags or sequencing requirements
  - Intentional design choices that look like mistakes (the agent will "fix" them otherwise)
  - Constraints that exist for external/business reasons (not captured in code)
  - Where to find authoritative documentation instead of guessing
  - Which operations need human sign-off before proceeding
  - Patterns where the reason matters as much as the rule (e.g. "X not Y, because Z")

DO NOT include:
  - Code style rules that are visible in existing files and inferrable from context
  - Framework or library usage that is standard and documented upstream
  - Architecture descriptions that are obvious from file structure and naming
  - Dependency lists (package.json is authoritative)
  - Type or schema definitions (the code is authoritative)
  - General JavaScript/Node/language best practices

KEEPING IT USEFUL:
  - Add an entry to Non-Standard Patterns when you (the agent) make a wrong assumption
    that causes a broken build or incorrect edit. That is the signal that an entry is needed.
  - Remove entries that have become obvious from reading the current code.
  - If an entry needs more than two sentences to explain, the code probably needs a comment instead.
  - A short, accurate AGENTS.md is more useful than a long, stale one.

FILLING IN THE TEMPLATE:
  Delete all placeholder comments (lines starting with <!-- or //) and replace the
  [PLACEHOLDER] sections with your project's actual values. Remove any section that
  does not apply to your project — an empty section adds noise.
-->

## Stack

<!-- List the runtime, language, and package manager. One line is usually enough.
     Only add library versions if the version choice is non-obvious or if the agent
     needs to consult version-specific docs. -->

[RUNTIME + VERSION], [LANGUAGE/DIALECT], [PACKAGE MANAGER].
[KEY LIBRARY]: [VERSION] — [link to version-specific API docs if needed]

## Commands

<!--
List only commands that:
  - Have non-obvious flags or sequencing requirements
  - Must be run in a specific order
  - Have side effects the agent might not expect

Omit commands that are standard scripts in package.json with obvious names (build, test, lint).
-->

```
[command]     # [what it does and when to use it]
[command]     # [what it does and when to use it]
```

## Validation Approach

<!--
Describe how correctness is verified. Specifically:
  - What is the authoritative pre-flight check (if any)?
  - Is there an automated test suite? If not, why, and what replaces it?
  - Are there manual checklists for specific scenarios?

If the project has standard test runners (jest, vitest, pytest) that the agent can
discover from package.json, omit this section.
-->

[Describe validation approach here, or delete this section if standard.]

## Non-Standard Patterns

<!--
This is the most important section. Each entry should describe a pattern that:
  - Looks wrong but is intentional
  - Caused a wrong agent action when it was missing
  - Represents a non-obvious invariant the agent must preserve

Format: [Short name]: [What and why — one or two sentences max.]
If you need more than two sentences, consider adding a comment in the code instead.

Start with an empty list and add entries as you discover they are needed.
-->

<!-- Example entries (delete these and replace with your own):
- Two-Step Data Update: Changing [data file] is not reflected until both [command A]
  and [command B] are run in sequence — running only one leaves the system inconsistent.
- Intentional Filter Asymmetry: [Mode A] intentionally includes [X] while [Mode B]
  filters it out — this is by design, not a bug.
- Non-Standard Env Parsing: Scripts use a custom env loader instead of dotenv because
  [reason] — do not replace it with dotenv.
-->

## Constraints

<!--
Hard rules the agent must never violate. Only list constraints that:
  - Would not be obvious from reading the code
  - Have external reasons (security, compliance, business, ops) not visible in the repo
  - The agent would be tempted to "improve away" without this guidance

Do NOT list constraints that are enforced by linters, type checkers, or CI — those
enforce themselves.
-->

- [Constraint and the reason it exists]
- [Constraint and the reason it exists]

## Autonomous Operation

<!--
Specify which operations require human confirmation before proceeding. Be specific
about categories of change, not individual files (files get renamed; categories don't).

Tailor this to your team's risk tolerance and the expertise level of likely users.
-->

Flag to the user and wait for confirmation before:
- [Category of change that needs human review]
- [Category of change that needs human review]
- Any refactor touching more than [N] files

When uncertain whether a change is safe, ask.

## Reference Documentation

<!--
List external documentation sources the agent should consult instead of guessing or
web-searching. Only include sources that are more authoritative or up-to-date than
the agent's training data for this specific project's stack.
-->

| Resource | URL or access method | When to use |
|----------|----------------------|-------------|
| [Resource name] | [URL or "via MCP server"] | [When to consult it] |

## Context File Maintenance

Updating AGENTS.md is part of task completion, not optional cleanup.

Add an entry to Non-Standard Patterns when:
- You made an incorrect assumption that caused a wrong edit or broken build
- A pattern in the codebase surprised you and the reason was not obvious
- You were corrected by the user on a design decision

Do not add general language or framework advice. Do not paraphrase existing entries.
Remove entries that have become obvious from the current state of the code.
