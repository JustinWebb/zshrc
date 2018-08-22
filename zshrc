# ------------------------------------------
# JWebb ZSH Setup
# ------------------------------------------
# 1) Be sure to use ZSH instead of Bash:
#   `chsh -s $(which zsh)`
# 2) Resolve unsafe ZSH directories:
#   https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories
#
# ------------------------------------------
# Environment Variables
# ------------------------------------------
PATH="/usr/local/bin:$(getconf PATH)" # https://github.com/creationix/nvm/issues/1652
export PATH=$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$PATH
export CODE=code
export EDITOR=$CODE

# ------------------------------------------
# NVM Setup (Git Install)
# ------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization for '.nvmrc'
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# ------------------------------------------
# Antigen Config
# ------------------------------------------
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use prezto

# Bundles from the default repo.
antigen bundles <<EOBUNDLES
    sorin-ionescu/prezto modules/helper # required for Git module
    sorin-ionescu/prezto modules/editor
    sorin-ionescu/prezto modules/git
    sorin-ionescu/prezto modules/prompt
    command-not-found
    sudo
    ssh-agent

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Load the theme.
    # antigen theme [theme]
    ## sindresorhus/pure ZSH theme as bundle
    mafredri/zsh-async
    sindresorhus/pure
EOBUNDLES

# Tell Antigen that you're done.
antigen apply

# Customize Pure theme's prompt ${PURE_PROMPT_SYMBOL:-❯}
prompt pure
PROMPT='%(?.%F{magenta}.%F{red}❯%F{magenta})❯%f '

# ------------------------------------------
# Custom Aliases
# ------------------------------------------

## Terminal Edits ##
alias code="nocorrect code"
alias ez="code ~/.zshrc"
alias rz="source ~/.zshrc"
alias uz="cp ~/dev/zshrc/zshrc ~/.zshrc && source ~/.zshrc"

## Navigation ##
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias dev="cd ~/desktop/dev"
alias gojob="cd ~/desktop/dev/zume"

## Git ##
alias gpom="git push origin master"
alias gc="git commit"
alias gcl="git clone"
alias ga="git add"
alias gaa="git add ."
alias gs="git status"
alias gb="git branch"
alias gpu="git pull"
alias gpum="git pull upstream master"
alias gp="git push"
alias gpo="git push origin"
alias gco="git checkout"
alias gcom="git checkout master"
alias gcb="git checkout -b" #checkout into new branch
alias gb="git branch"
alias gt="git tag"
alias gl="git log"
alias glo="git log --oneline"
alias glgp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias grs="git reset"
alias grv="git revert"
alias gm="git merge"
alias gd="git diff"
alias grb="git rebase"
alias grbi="git rebase -i"
alias grbc="git rebase --continue"
alias grbm="git rebase master"
alias grbmi="git rebase -i master"
alias gprum="git pull --rebase upstream master"
alias gf="git fetch"
alias gr="git remote"
alias gst="git stash"
alias gsa="git stash apply"

# ------------------------------------------
# Custom Functions
# ------------------------------------------

# Sample function
# function name (){what do to; what else to do;}

# Make directory and change to it in one command
function mkcd () {
  mkdir "$1"
  cd "$1"
}

# Output each path in $PATH to its own line
function path () {
  $SHELL -l -c 'echo $PATH | tr : "\n"'
}

# Print number of one-lined git logs equal to (n)
function gloc () {
  git log --oneline -"$1"
}

# search filenames for occurances
function filelike () {
  find . -iname "*$1" -print
}

# Show all node processes
function listnode () {
  ps -ef | grep node
}

# Kill all node processes
function killnode () {
  pkill -f node
}

# Recursively remove .DS_Store files from project
function killdsstore () {
  find . -name '*.DS_Store' -type f delete
}

# kill stray LiveReload processes
# http://danisadesigner.com/blog/killing-livereload-server/
function lrkill () {
  LRPID=`lsof -n -i4TCP:35729 | grep LISTEN | awk '{print $2}'`

  if [ $LRPID ]
    then
    echo 'Killing LiveReload server (PID: '$LRPID')'
    kill $LRPID
  fi
}

# Open sublime project
function sp (){
  if [ -f ./*.sublime-project ]; then
    subl ./*.sublime-project
  else
    echo No sublime-project file available
  fi
}
