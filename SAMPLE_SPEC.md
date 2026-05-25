# Project Spec: [Project Name]

> **How to use this template**
> Fill in what you know. Leave sections blank rather than guessing — a blank section is a signal to pause, not to proceed.
> This spec is a *contract with your AI coding agent*. Vague inputs produce vague (and often insecure) outputs.
> Delete this callout block before sharing with your agent.

---

## 1. Identity

| Field | Value |
|---|---|
| **Project name** | |
| **Owner / requestor** | |
| **Primary audience** | Who will use this? (internal team, customers, execs, public) |
| **Environment** | Where will it run? (laptop only, internal network, cloud, public internet) |
| **Stack constraints** | Languages, frameworks, or platforms you must or must not use |

---

## 2. The One-Liner

> Write a single sentence that completes: *"This tool exists so that ________."*

---

## 3. Why Now?

What changed that makes this worth building today? A deadline, a customer ask, a gap in existing tooling?

This section prevents scope creep by anchoring the project to a real, time-bound need.

---

## 4. User Goals

List 3–5 things a user should be able to *accomplish* (not features — outcomes).

- As a [role], I want to [action] so that [benefit].
- As a …

> **SA tip:** If you can't write at least two of these, the project isn't defined enough to start.

---

## 5. Explicit Scope

### In scope
- 
- 

### Out of scope (important — say this out loud)
- 
- 

> Telling the agent what *not* to build is as important as what to build. Without this, agents gold-plate.

---

## 6. Data & Trust Boundaries

*This is the most important security section. Answer before writing a single line of code.*

| Question | Answer |
|---|---|
| What data will this app touch? | |
| Does any of it contain PII, credentials, or confidential business data? | Yes / No / Unsure |
| Who is allowed to read that data? | |
| Who is allowed to write or modify it? | |
| Does data leave the machine / network? | Yes / No — describe where |
| Will this app call external APIs or services? | List them |
| Will this app read from or write to the filesystem? | Which paths? |
| Will this app execute commands or subprocesses? | Yes / No |

> **Red flags that require a security review before proceeding:**
> - PII or credentials in scope
> - Outbound calls to services you don't control
> - Filesystem writes outside a sandboxed directory
> - Any subprocess execution where input comes from a user or file

---

## 7. Acceptance Criteria

What does "done" look like? Write these as testable statements.

- [ ] Given [context], when [action], then [result].
- [ ] Given …
- [ ] Given …

> Aim for 3–7 criteria. If you have more than 10, the scope is too large.

---

## 8. Security Requirements

Be explicit. The agent will not infer these.

### Authentication & access
- [ ] Who can access this app? (anyone, authenticated users, specific roles)
- [ ] How is identity established? (SSO, API key, none — and why)

### Input handling
- [ ] All user-supplied input must be validated and sanitized before use
- [ ] File uploads (if any): restrict by type, size, and storage path
- [ ] No user input may be passed to shell commands, eval(), or SQL without parameterization

### Secrets management
- [ ] No secrets, tokens, or passwords in source code or committed files
- [ ] Secrets sourced from: `[ ]` env vars  `[ ]` secrets manager  `[ ]` `.env` file (local only, gitignored)
- [ ] `.gitignore` includes: `.env`, credential files, local data files

### Dependencies
- [ ] Third-party packages must be reviewed before inclusion (use Socket or equivalent)
- [ ] Pinned versions required: `[ ]` Yes  `[ ]` No — explain why

### Logging
- [ ] Logs must not contain PII, credentials, or sensitive business data
- [ ] Log destination: (stdout, file, log aggregator)

### Network exposure
- [ ] Binds to: `[ ]` localhost only  `[ ]` internal network  `[ ]` public internet
- [ ] If network-exposed: document which ports and why

---

## 9. Constraints & Non-Negotiables

Hard limits the agent must respect — these override any "helpful" suggestions.

- [ ] Must run entirely offline / air-gapped
- [ ] Must not install additional system packages
- [ ] Must not spawn background processes or daemons
- [ ] Must not modify files outside the project directory
- [ ] Must not make network calls to: [list any blocked domains or services]
- [ ] Code must be readable by a non-expert (no obfuscation, minimal magic)
- [ ] Other: 

---

## 10. Definition of Done (Checklist)

The agent (and you) sign off only when all of these are true.

- [ ] All acceptance criteria pass
- [ ] No hardcoded secrets in any file
- [ ] `.gitignore` is present and correct
- [ ] Dependencies are documented (requirements.txt / package.json / etc.)
- [ ] A `README.md` exists with: purpose, setup steps, and known limitations
- [ ] Security requirements above are addressed (note any intentional exceptions with justification)
- [ ] The app does not request more permissions / access than it needs

---

## 11. Known Risks & Open Questions

What do you already know you don't know? Parking lot for decisions not yet made.

| Risk / Question | Owner | Status |
|---|---|---|
| | | Open / Resolved |
| | | Open / Resolved |

---

## 12. Agent Instructions (optional but recommended)

Specific directives for your AI coding agent. Copy what applies.

```
You are building the project described in this spec. Before writing any code:
1. Confirm your understanding of the data & trust boundaries section with me.
2. Flag any acceptance criteria that conflict with the security requirements.
3. Ask before adding any dependency not implied by the stack constraints.
4. Do not create any file that writes outside the project directory.
5. If you are uncertain whether something is in scope, ask — do not infer.
```

---

*Spec version: 1.0 | Last updated: [date] | Status: Draft / Review / Approved*
