PROMPT='
%B%~%b
'
setopt prompt_subst
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git*' formats "%b %a %m"
PROMPT="
%~ \$vcs_info_msg_0_ %M
"

autoload -U compinit
compinit
setopt correctall

function kk(){
    git checkout --track -b $1 origin/master
}

# aliases
alias reload='source ~/.zshrc'
alias gca='git commit -a'
alias ac='git commit -a --amend --no-edit'
alias acc='git commit --amend --no-edit'
alias ga='git add'
alias grsh='git reset --hard'
alias gc='git commit'
alias gg='git grep'
alias gs='git status'
alias gld='git log --patch'
alias g='git'
alias gd='git diff'
alias gcp='git cherry-pick'
alias gca='git commit --all'
alias ga='git add'
alias reload='source ~/.zshrc'
alias gshow='git show'
alias todo='git log --branches --not --remotes --oneline --decorate --graph'
alias gc='git commit'
alias ac='git commit --all --amend --no-edit'
alias acc='git commit --amend --no-edit'
alias ae='vim ~/.zshrc; reload'
alias gcF='git commit --amend'
alias drop1='git reset --hard HEAD~1'
alias gco='git checkout'
alias pu='git pull --rebase'
alias gld='git log --patch --format=full'
alias grsh='git reset --hard'
alias gs='git status --short --branch'
alias ri='git rebase --interactive'
alias db='git branch -D'
alias gb='git branch'
alias gg='grep -nri '
alias rr='sudo /etc/init.d/apache2 restart'
alias gap='git add --patch'
alias con='git rebase --continue'
alias grs='git rebase --skip'
alias aa='cd ~/ans2/web/lib/a'
alias gl='git log'
alias VIM='vim -u NONE -N'
alias puso='git pull --rebase && git push origin HEAD:master'

# instant deployment
alias vv='vim ~/dotfiles/zshrc; cd ~/dotfiles/; ./install.sh; reload'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fasd --init auto)"

source ~/.hidden.zsh

# stolen from https://gist.github.com/matthewmccullough/787142
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed
setopt HIST_FIND_NO_DUPS
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=' '
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    echo "$EXIT_CODE_PROMPT"
  fi
}
RPROMPT='$(check_last_exit_code)'
export HISTTIMEFORMAT="%F %T "
function new_branch() {
    WORD_ONE=$(shuf -n1 /usr/share/dict/words | head -1)
    WORD_TWO=$(shuf -n1 /usr/share/dict/words | head -1)
    BRANCH_NAME="${WORD_ONE}_${WORD_TWO}"
    git checkout -b $BRANCH_NAME origin/master
}

fpath=(/Users/snihalan/.zsh/gradle-completion $fpath)

alias puso='git pull --rebase && git push origin HEAD:master'
export GROOVY_HOME=/usr/local/opt/groovy/libexec

eval "$(direnv hook zsh)"

export PATH="$HOME/.poetry/bin:/usr/local/Cellar/proj@7/7.2.1/bin/:$PATH"
export LD_LIBRARY_PATH="/usr/local/Cellar/proj@7/7.2.1/include:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="/usr/local/Cellar/proj@7/7.2.1//lib/pkgconfig:$PKG_CONFIG_PATH"


fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

. ~/.envrc-personal

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.


export PATH="/usr/local/opt/openssl@3/bin:$PATH"


. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib $LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include $CPPFLAGS"

export LDFLAGS="-L/usr/local/opt/openssl@3/lib $LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include $CPPFLAGS"

export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"
  . /usr/local/opt/asdf/libexec/asdf.sh

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
export PATH="/usr/local/opt/python@3.6/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/python@3.6/lib"
export PATH="/Users/suren/.local/bin:$PATH"
export REQUESTS_CA_BUNDLE="/Users/suren/.asdf/installs/python/3.9.6/lib/python3.9/site-packages/certifi/cacert.pem"
export PATH="/Users/suren/miniconda3/bin:/Users/suren/miniconda3/condabin:$PATH"

export PATH="/usr/local/opt/bzip2/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/suren/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/suren/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/suren/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/suren/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
CERT_PATH=$(python -m certifi)
export SSL_CERT_FILE=${CERT_PATH}
export REQUESTS_CA_BUNDLE=${CERT_PATH}
export PATH="/usr/local/opt/python@3.6/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"

. $HOME/.asdf/asdf.sh
eval $(direnv hook zsh)
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete my-awesome-script)"
export PIP_USE_DEPRECATED=html5lib
./osx.zshrc
