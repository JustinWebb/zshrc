# ------------------------------------------
# Environment Variables
# ------------------------------------------
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export CODE=code
export EDITOR=$CODE

# ------------------------------------------
# NVM Setup
# ------------------------------------------
# Recommended installation instructions from SO article require additional
# steps:
#   # 4.1 - remove NPM_CONFIG_PREVIX variable
#   # 4.2 - source /etc/profile.d/nvm.sh
# http://stackoverflow.com/questions/11542846/nvm-node-js-recommended-install-for-all-users
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm


# ------------------------------------------
# Antigen Config
# ------------------------------------------
source ~/dev/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use prezto

# Bundles from the default repo.
antigen bundle sorin-ionescu/prezto modules/helper  # required for Git module
antigen bundle sorin-ionescu/prezto modules/editor
antigen bundle sorin-ionescu/prezto modules/git
antigen bundle sorin-ionescu/prezto modules/prompt
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
alias code="nocorrect code"
alias ez="code ~/.zshrc"
alias rz="source ~/.zshrc"
alias uz="cp ~/dev/zshrc/.zshrc ~/.zshrc && source ~/.zshrc"

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
function mkcd (){
    mkdir "$1"
    cd "$1"
}

# Open sublime project
function sp (){
  if [ -f ./*.sublime-project ]; then
    subl ./*.sublime-project
  else
    echo No sublime-project file available
  fi
}

# Output each path in $PATH to its own line
function pathvar () {
    $SHELL -l -c 'echo $PATH | tr : "\n"'
}

# Print number of one-lined git logs equal to (n)
function gloc () {
    git log --oneline -"$1"
}

# search filenames for occurances
function filelike () {
    find . -iname "*$1" -print
}

# kill stray LiveReload processes
# http://danisadesigner.com/blog/killing-livereload-server/
lrkill () {
    LRPID=`lsof -n -i4TCP:35729 | grep LISTEN | awk '{print $2}'`

    if [ $LRPID ]
        then
        echo 'Killing LiveReload server (PID: '$LRPID')'
        kill $LRPID
    fi
}

# Recursively remove .DS_Store files from project
killdsstore () {
    find . -name '*.DS_Store' -type f delete
}
