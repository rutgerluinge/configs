autoload -Uz colors compinit && colors && compinit
setopt PROMPT_SUBST

# Show time once when opening a new terminal
print -P "%F{green}Started at: %*%f"

_git_branch() {
  local br
  br=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  [[ "$br" == "HEAD" ]] && br=$(git rev-parse --short HEAD 2>/dev/null) || true
  echo "%F{cyan}[${br}]%f"
}

_folder_part() {
  echo "%F{blue}%1~%f"
}

PROMPT='$(_git_branch)$(_folder_part)> '
