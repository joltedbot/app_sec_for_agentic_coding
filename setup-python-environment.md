# Python Environment Setup

## 1. Install uv

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Restart your terminal, then confirm:

```bash
uv --version
```

## 2. Set Up Shell Aliases

Open your shell config file in a text editor:

- macOS (zsh): `~/.zshrc`
- Linux (bash): `~/.bashrc`

Add these lines at the bottom:

```bash
alias pip='uv pip'
alias pip3='uv pip'
```

Reload your shell:

```bash
source ~/.zshrc   # macOS
source ~/.bashrc  # Linux
```

## 3. Verify Aliases

```bash
pip --version   # should show uv pip
pip3 --version  # should show uv pip
```

## Caveats

**`uv pip` is a compatibility shim — it does not manage a lockfile.** For projects that use `pyproject.toml`, prefer the native uv workflow: `uv add <package>` (adds the dependency and updates `uv.lock`) and `uv sync` (installs from the lockfile). Reserve `uv pip install` for one-off or global installs.

**Virtual environment activation required.** `uv pip install` installs into the currently active virtual environment. If none is active it may install globally or error. Create and activate one first:

```bash
uv venv
source .venv/bin/activate
```

Alternatively, use `uv run <command>` to run a command inside the project environment without explicit activation.
