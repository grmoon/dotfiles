# Homebrew
export PATH="/Users/gmoon/homebrew/bin:$PATH"

# Command Prompt
export PS1="[\h:\W \u] "

# Set Terminal Style to vim
set -o vi

# Aliases
alias sbp="source ~/.bash_profile && echo 'Sourced ~/.bash_profile'"
alias vbp="vim ~/.bash_profile"
alias rmpyc="find . -name "*.pyc" -exec rm -f {} \;"

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# fzf settings
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden -g '!*venv/' -g '!*.svg' -g '!*.ps' \
    -g '!*.pyc' -g '!*.mako.py' -g '!.idea' -g '!.swp' -g '!.hg*' -g '!.coverage*' -g '!cover/' -g '!fonts/' -g '!*.cache'"


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
test -e "${HOME}/.tru_bash_profile" && source "${HOME}/.tru_bash_profile"

task
