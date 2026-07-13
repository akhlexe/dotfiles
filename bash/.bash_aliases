alias cat='batcat'
alias oc='opencode'

tm() {
	local session="${1:-main}"

	if [ -n "$TMUX" ]; then
		tmux has-session -t "$session" 2>/dev/null || tmux new-session -d -s "$session"
		tmux switch-client -t "$session"
	else
		tmux new-session -A -s "$session"
	fi
}
