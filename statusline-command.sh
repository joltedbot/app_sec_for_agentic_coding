#!/usr/bin/env bash
# Claude Code status line script
# Reads JSON from stdin and outputs a formatted status line
# Displays: current directory | git branch | model/agent | ctx % (used/total)

input=$(cat)

# --- Extract fields ---
cwd=$(echo "$input"          | jq -r '.cwd // .workspace.current_dir // "?"')
model=$(echo "$input"        | jq -r '.model.display_name // .model.id // "?"')
agent_name=$(echo "$input"   | jq -r '.agent.name // empty')
used_pct=$(echo "$input"     | jq -r '.context_window.used_percentage // empty')
total_in=$(echo "$input"     | jq -r '.context_window.total_input_tokens // empty')
total_out=$(echo "$input"    | jq -r '.context_window.total_output_tokens // empty')

# --- ANSI color helpers ---
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
CYAN='\033[36m'
BLUE='\033[34m'
YELLOW='\033[33m'
GREEN='\033[32m'
RED='\033[31m'
MAGENTA='\033[35m'
WHITE='\033[37m'

# --- Directory: shorten $HOME to ~ ---
display_cwd="${cwd/#$HOME/\~}"

# --- Git branch (skip optional locks to avoid interference) ---
git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null \
             || GIT_OPTIONAL_LOCKS=0 git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
    [ -n "$branch" ] && git_branch="$branch"
fi

# --- Model/agent label ---
if [ -n "$agent_name" ]; then
    model_label="agent:${agent_name} (${model})"
else
    model_label="$model"
fi

# --- Helper: abbreviate token counts (399 -> "399", 45200 -> "45K", 1000000 -> "1M") ---
abbrev_tokens() {
    echo "$1" | awk '{
        v = $1 + 0
        if (v >= 1000000) printf "%.1fM", v/1000000
        else if (v >= 1000) printf "%.0fK", v/1000
        else printf "%d", v
    }'
}

# --- Context window fullness (how close to compaction) ---
ctx_info=""
ctx_color="$GREEN"
if [ -n "$used_pct" ]; then
    pct_fmt=$(echo "$used_pct" | awk '{if ($1 < 1 && $1 > 0) printf "%.1f", $1; else printf "%.0f", $1}')

    if   [ "$(echo "$used_pct >= 80" | bc -l 2>/dev/null)" = "1" ]; then ctx_color="$RED"
    elif [ "$(echo "$used_pct >= 50" | bc -l 2>/dev/null)" = "1" ]; then ctx_color="$YELLOW"
    fi

    ctx_info="ctx ${pct_fmt}%"
fi

# --- Session token consumption (cumulative in + out) ---
session_info=""
if [ -n "$total_in" ] && [ -n "$total_out" ]; then
    session_total=$(( total_in + total_out ))
    session_info="$(abbrev_tokens "$session_total") tokens"
elif [ -n "$total_in" ]; then
    session_info="$(abbrev_tokens "$total_in") tokens"
fi

# --- Assemble output ---
SEP=" $(printf '\033[2m|\033[0m') "
line=""

# 1. Directory
line+="$(printf "${BOLD}${CYAN}%s${RESET}" "$display_cwd")"

# 2. Git branch (only when inside a repo)
if [ -n "$git_branch" ]; then
    line+="${SEP}$(printf "${MAGENTA}%s${RESET}" "$git_branch")"
fi

# 3. Model / agent
line+="${SEP}$(printf "${BLUE}%s${RESET}" "$model_label")"

# 4. Context window fullness
if [ -n "$ctx_info" ]; then
    line+="${SEP}$(printf "${ctx_color}%s${RESET}" "$ctx_info")"
fi

# 5. Session token consumption
if [ -n "$session_info" ]; then
    line+="${SEP}$(printf "${DIM}${WHITE}%s${RESET}" "$session_info")"
fi

printf "%b\n" "$line"
