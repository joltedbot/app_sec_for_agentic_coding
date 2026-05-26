# Project Spec: [Project Name]

> **How to use this**
> Fill in what you know. Leave a field blank rather than guessing.
> Delete this block before sharing with your agent.

---

## 1. What is this?

| Field | Value |
|---|---|
| **Project name** | |
| **Built by / for** | |
| **Who will use it** | Just me / my team / customers / public |
| **Where will it run** | My laptop / internal network / Vercel / other cloud |
| **Language / framework** | Node.js / Python / React / other — or no preference |

---

## 2. The One-Liner

> *"This tool exists so that ________."*

One sentence. If you can't write it, the project isn't ready to start.

---

## 3. What should it do?

List 3–5 things a user needs to be able to accomplish.

- 
- 
- 

---

## 4. What is it NOT?

The most underrated section. Tell the agent what to skip.

- Not trying to: 
- Don't build: 
- Don't add: (login system, database, admin panel — unless you listed it above)

> Without this, agents add features you didn't ask for.

---

## 5. Data & Secrets

*Answer these before writing any code. They determine how safe the app is.*

| Question | Answer |
|---|---|
| What data does this app touch? | |
| Does it contain passwords, API keys, or personal info? | Yes / No |
| Will it call any external APIs or services? | List them, or No |
| Will it read or write files on your computer? | Yes (which folder?) / No |
| If deployed: who is allowed to use it? | Anyone / Only me / Specific people |

### Secrets rule (always apply this)

- [ ] No passwords, API keys, or tokens in the code itself
- [ ] Use a `.env` file for secrets — never commit it
- [ ] `.gitignore` includes `.env` and any files with real data

> If you're deploying to Vercel, add secrets via Vercel's Environment Variables dashboard — not in the code.

---

## 6. Done looks like...

What does "finished" mean for this project? Write 3–5 simple statements.

- [ ] A user can [do the main thing]
- [ ] 
- [ ] 
- [ ] No passwords or API keys appear in any source file
- [ ] A README exists explaining what it does and how to run it

---

## 7. Agent Instructions

Paste this at the top of your first message to the agent.

```
Build the project described in this spec. Before writing any code:
1. Confirm what data the app will handle and where it will go.
2. Ask before adding any third-party package that isn't obviously required.
3. Use a .env file for all secrets and credentials — never put them in code.
4. Add .env to .gitignore before writing any other file.
5. If something isn't in scope above, ask me first — don't add it.
6. Keep the code simple and readable. This doesn't need to scale to 10,000 users.
```

---

*Last updated: [date]*
