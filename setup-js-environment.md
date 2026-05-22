# JavaScript Environment Setup

## 1. Install pnpm

```bash
npm install -g pnpm
pnpm setup
```

Restart your terminal, then confirm:

```bash
pnpm --version
```

## 2. Install Socket Firewall (sfw)

```bash
pnpm install -g @socketsecurity/cli
```

Confirm:

```bash
sfw --version
```

## 3. Set Up Shell Aliases

Open your shell config file in a text editor:

- macOS (zsh): `~/.zshrc`
- Linux (bash): `~/.bashrc`

Add these three lines at the bottom:

```bash
alias pnpm='sfw pnpm'
alias npm='pnpm'
alias npx='pnpm dlx'
```

Reload your shell:

```bash
source ~/.zshrc   # macOS
source ~/.bashrc  # Linux
```

## 4. Verify Aliases

```bash
type npm    # should show: npm is aliased to pnpm
type pnpm   # should show: pnpm is aliased to sfw pnpm
pnpm --version
```

## Caveats

**Aliases do not apply in non-interactive shells.** CI pipelines and scripts that source a clean environment will not have these aliases. Use the underlying commands directly in those contexts: `sfw pnpm` (or plain `pnpm` if you do not need the firewall wrapper in CI).

**`pnpm-lock.yaml` replaces `package-lock.json`.** Commit `pnpm-lock.yaml` and delete any existing `package-lock.json`. Mixing lockfile formats in the same repo causes conflicts.

**The `npm` alias is best-effort.** A small number of npm-specific flags and lifecycle behaviours differ from their pnpm equivalents. If a script behaves unexpectedly, check the [pnpm migration guide](https://pnpm.io/blog/2020/10/17/migrating-from-npm) for known differences.
