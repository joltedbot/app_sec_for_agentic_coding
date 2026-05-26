# Application Security for Vibecoding

Resources for application security practices in the context of AI-assisted (vibe) coding. 

---

## Files

| File | Description |
|------|-------------|
| `agents/` | Prompt/instruction files for specialized AI sub-agents used in the workshop. Each file defines the role, behavior, and constraints for a specific agent (security-watchdog, code-quality-reviewer, validation-specialist, project-archivist). Works with the Agent Usage Policy section in the sample_claude_md_content.md file. |
| `git/` | Git configuration resources for the workshop. Currently contains a `hooks/pre-commit` hook that pipes staged diffs through `gitleaks` to detect secrets before they are committed. Copy the pre-commit file to the .git/hooks folder in all your projects.  Requires gitleaks to be installed from homebrew or manually - [Gitleaks](https://github.com/gitleaks/gitleaks) |
| `MINI_SPEC.md` | A smaller, minimal project specification template. Use this for simpler projects where the full `SAMPLE_SPEC.md` would be overkill. Copy it to a new or existing project as SPEC.md, fill it in, and have the agent read it before begining/continuing working on the code. |
| `SAMPLE_SPEC.md` | A full project specification template. Demonstrates how to write a detailed spec that gives AI agents enough context to produce secure, correct code. Copy it to a new or existing project as SPEC.md, fill it in, and have the agent read it before begining/continuing working on the code. |
| `sample_claude_md_content.md` | Example content for a `CLAUDE.md` file, which provides project-wide instructions to Claude Code. Shows the kinds of rules and constraints that improve agent behavior and security posture. I keep this in my user level CLAUDE.md file in ~/.claude/CLAUDE.md. Read it and pick and choose what makes the most sense for your projects and workflow. |
| `setup-js-environment.md` | Step-by-step instructions for moving your npm & npx based Node/Javascript tools to the more secure socket firewall projected pnpm & pnpm dlx based tooling. |
| `setup-python-environment.md` | Step-by-step instructions for moving your pip based Python tools to the more secure uv tooling. |
| `statusline-command.sh` | Drop this into your ~/.claude/ directory to replace the standard status line in Claude Code with a more useful one that shows the context window consuption and tokens used for the project. |
| `tools.md` | Reference list of security CLI tools and their purposes, relevant to the workshop. |
| `your_project` | Template for an `AGENTS.md` file — the project-level instructions file that guides AI coding agents. Covers conventions, constraints, and rules agents should follow in a given repo. AGENTS.md is used by Gemini and other agents except Claude Code which uses CLAUDE.md.  I maintain AGENTS.md with CLAUDE.md as a symlink which is also in the folder. Copy both files to the root directory of you project and have the agent read it, fill it in and use it for the project going forward. |
