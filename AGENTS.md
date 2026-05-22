## Critical Rules

**Never Hardcode Credentials, API Keys, Certificates, Passwords, SSH Keys, or secret values**
- Use a .env file strategey for secrets for Javascript and Python apps
- Use environment variables if there are known exisitng variables for the application or service you are interacting with
- If there is not a simple clear secure mechanism for storing these secrets do not invent one or guess. Stop and ask the user and devise a plan together

**Uncommitted Changes Check — Session Start:**
- **ALWAYS run `git status` as the very first action at the start of every session**
- If there are uncommitted changes (modified, staged, or new untracked source files):
  - **STOP — do not modify, create, or delete any files**
  - Show the affected files and warn: "There are uncommitted changes. Making edits now risks losing work done since the last commit."
  - Ask: "How would you like to handle this before I proceed? (e.g., commit, stash, discard, or confirm it is safe to continue)"
  - **Do not make any file changes until the user explicitly confirms**

**Unexpected File Changes — Mid-Session Detection:**
- If you detect changes to files you did not make in the current session:
  - **STOP immediately — do not make any further changes**
  - **Do NOT attempt to fix, roll back, stash, drop, reset, or otherwise "correct" this** — any automated correction risks overwriting the user's work
  - Inform the user which files changed and that concurrent human and agent edits can cause conflicts
  - Ask: "Did you make these changes? How would you like to proceed?"
  - **Wait for explicit instructions before taking any further action**

**Node Package Management**

Use **pnpm exclusively**. Never use npm or npx directly. Key non-obvious commands: `pnpm dlx <tool>` (replaces npx), `pnpm exec <bin>` (project binary), `pnpm install --frozen-lockfile` (CI install). Never edit `pnpm-lock.yaml` manually.

**Python Package Management**

Use **uv exclusively**. Never use pip or pip3 directly. Key non-obvious commands: `uvx <tool>` (ephemeral CLI), `uv sync --locked` (install from lockfile), `uv lock --upgrade-package <name>` (targeted upgrade). Never edit `uv.lock` manually.


## RPI Framework: Research -> Plan -> Implement

For non-trivial changes, follow this three-phase approach with explicit user approval at each phase boundary. Each STOP is a hard gate — do not proceed without explicit user approval.

**Requires RPI:** Architecture changes, multi-file refactors, new features, complex bug fixes
**Skip RPI:** Typo fixes, single-line edits, formatting changes, simple corrections
**RPI plans:** stored in `.claude/plans/` within the repo.

Track each RPI project in a single `.md` file stored in `.claude/plans/` within the repo. Use a descriptive filename (e.g., `setup-md-plan.md`). The file must include:
- `## Acceptance Criteria` — written during Research, signed off by the user, used by validation-specialist
- `## Research` — key findings, decisions, and constraints
- `## Plan` — stage-by-stage implementation breakdown
- `## Phase Status` — which phases are complete and whether implementation is pending/in-progress

### Phase 1: Research (What should be done)
- Understand the request and analyze current codebase state
- Ask clarifying questions iteratively to define scope and desired outcomes
- Document key decisions, constraints, and critical context for later phases
- **Primary deliverable: Acceptance Criteria** — define measurable conditions the final implementation must satisfy. These criteria:
  - Are written to the plan file under an `## Acceptance Criteria` section
  - Are shared with the user and iterated on collaboratively before the phase ends
  - Drive the Plan phase (what stages are needed to meet each criterion)
  - Are used by the validation-specialist to verify the Implement phase succeeded
- **STOP:** Present acceptance criteria to the user, collaborate to refine them, and get explicit confirmation they are complete and correct before proceeding to Plan

### Phase 2: Plan (How should it be done)
- Design implementation approach based on Research phase findings
- Break down work into discrete, validatable stages
- Collaborate with user to refine plan where helpful
- Self-review holistically — does it achieve the goal? Are there issues?
- Document the complete plan with stage-by-stage breakdown
- **STOP:** Get explicit user approval before proceeding to Implement

### Phase 3: Implement (Execute the plan)
- **STOP FIRST:** Get explicit user approval to START work
- Follow all standing instructions including the three-strikes rule
- Execute plan in stages; validate success after EACH stage
- If major deviations from plan are needed:
  - STOP implementation immediately
  - Analyze impact on overall plan, revise the plan document
  - Get user approval before continuing
- Perform final validation and testing after all stages complete
- Document what was implemented and any deviations from plan
- Before declaring implementation complete, run the full post-implementation gate sequence in order:
  - security-watchdog — verify security of the solution
  - code-quality-reviewer — verify code quality and convention consistency
  - validation-specialist — verify acceptance criteria and output correctness. Pass the plan file path. Do not proceed until this agent returns a PASS.
  - project-archivist — update memory and docs. Pass a brief summary of wrong assumptions, user corrections, and non-obvious patterns from this session.

### Three-Strike Rule
When an approach is repeatedly blocked — whether by compilation errors, test failures, tool rejections, user interruptions, or any other blocker — count each failed or rejected attempt as a strike:
1. **First attempt**: Try a straightforward approach
2. **Second attempt**: Try one alternative approach
3. **Third attempt**: Try one more focused variation
4. **After three failures**: STOP, revert any changes, reassess, and ask the user how to proceed — do not keep retrying the same pattern

## Communication Style

- **Concise over exhaustive** — Brief, clear answers; offer to elaborate if needed
- **Design questions**: 2-3 options with 1-2 sentence pros/cons, clear recommendation, ask if more detail needed
- **Implementation**: Step-by-step plans when requested; focus on what and why, not full code blocks unless asked
- **No redundancy**: Reference earlier points rather than restating
- **Scale to scope**: Simple questions get simple answers; complex tasks get detailed plans

## General Guidelines

- Prefer simple, idiomatic solutions
- Ask questions when knowledge of intent improves the solution
- Ask before adding new dependencies
- If architecture makes a solution complex, discuss changes rather than working around issues
- Recommend refactoring separately when found code isn't part of the current task
- If a solution fails multiple times, stop and ask for input

## Agent Usage Policy

You have specialized subagents. **Use them proactively** — do not wait for the user to ask.

**security-watchdog** — Launch if the implementation touches any of the following, no exceptions: authentication or session handling, authorization or access control, file upload or download, any external API integration, environment variables or secrets, user input that reaches a database or filesystem, or cryptographic operations. If uncertain whether a change qualifies, launch the agent. The cost of a false positive is zero. The cost of a false negative is not.
