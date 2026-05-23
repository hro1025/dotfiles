# Git branch
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\*/s/\* \(.*\)/ (\1)/p'
}

# ---------- Aliases ----------
alias ll='ls -l --color=auto'
alias ls='ls -l --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'

# ---------- Prompt ----------
PS1='\[\e[38;2;122;162;247m\]\w\[\e[38;2;187;154;247m\]$(parse_git_branch)\n\[\e[38;2;247;118;142m\]❯\[\e[0m\] '

# ---------- LS Colors ----------
export LS_COLORS="di=38;2;122;162;247:ln=38;2;125;207;255:so=38;2;187;154;247:pi=38;2;224;175;104:ex=38;2;247;118;142:bd=38;2;65;72;104:cd=38;2;65;72;104:su=38;2;247;118;142:sg=38;2;224;175;104:tw=38;2;122;162;247:ow=38;2;122;162;247:"

# ---------- Path ----------
export PATH="$PATH:$HOME/.dotnet/tools"

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
	exec uwsm start hyprland.desktop
fi
