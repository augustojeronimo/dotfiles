##################
###   PROMPT   ###
##################

# Colors #
autoload -U colors && colors
setopt PROMPT_SUBST


# Functions #
git_prompt() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n $branch ]] && echo "%F{yellow}($branch)%f "
}


# Final Prompt #
PROMPT='%F{blue}%n%f %F{cyan}%~%f $(git_prompt)%F{magenta}❯%f '

