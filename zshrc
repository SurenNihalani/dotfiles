PROMPT='
%B%~%b
'
setopt prompt_subst
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git*' formats "%b %a %m"
PROMPT="
%~ \$vcs_info_msg_0_
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
alias gg='grep -nri'
alias gs='git status'
alias gld='git log --patch'
alias g='git'
alias gd='git diff'
alias gcp='git cherry-pick'
alias p='pygrep'
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
alias t='yo test'
alias n3='nosetests3 --ipdb --ipdb-failures -s'
alias db='git branch -D'
alias gb='git branch'
alias gg='grep -nri '
alias rr='sudo /etc/init.d/apache2 restart'
alias ns='noseipdb'
alias gap='git add --patch'
alias con='git rebase --continue'
alias j='jsgrep'
alias nn='python64 -m nose -s --ipdb --ipdb-failures'
alias grs='git rebase --skip'
alias aa='cd ~/ans2/web/lib/a'
alias gl='git log'
alias VIM='vim -u NONE -N'
alias l='nocorrect yo lint'

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
