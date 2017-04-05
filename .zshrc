# ------------------------------------------
# Environment Variables
# ------------------------------------------
export CODE=code
export EDITOR=$CODE

# ------------------------------------------
# NVM Setup
# ------------------------------------------
# Recommended installation instructions from SO article require additional
# steps:
#   # 4.25 - remove NPM_CONFIG_PREVIX variables
#   # 4.75 - source /etc/profile.d/nvm.sh
# http://stackoverflow.com/questions/11542846/nvm-node-js-recommended-install-for-all-users
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm


# ------------------------------------------
# Antigen Config
# ------------------------------------------
source ~/dev/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle sudo
antigen bundle ssh-agent

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme [theme]
## sindresorhus/pure ZSH theme as bundle ##
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell Antigen that you're done.
antigen apply

# ------------------------------------------
# Custom Aliases
# ------------------------------------------

## Terminal Edits ##
alias ez="code ~/.zshrc"
alias rz="source ~/.zshrc"
alias code="nocorrect code"

## Git ##
alias gpom="git push origin master"
alias gc="git commit"
alias gcl="git clone"
alias ga="git add"
alias gaa="git add ."
alias gs="git status"
alias gb="git branch"
alias gpu="git pull"
alias gpum="git pull upstream master"
alias gp="git push"
alias gpo="git push origin"
alias gco="git checkout"
alias gcom="git checkout master"
alias gcb="git checkout -b" #checkout into new branch
alias gb="git branch"
alias gt="git tag"
alias gl="git log"
alias glo="git log --oneline"
alias grs="git reset"
alias grv="git revert"
alias gm="git merge"
alias gd="git diff"
alias grb="git rebase"
alias grbi="git rebase -i"
alias grbc="git rebase --continue"
alias grbm="git rebase master"
alias grbmi="git rebase -i master"
alias gprum="git pull --rebase upstream master"
alias gf="git fetch"
alias gr="git remote"
alias gst="git stash"
alias gsa="git stash apply"

# ------------------------------------------
# Custom Functions
# ------------------------------------------

