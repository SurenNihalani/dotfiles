PROMPT='
%B%~%b
'

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
