PROMPT='
%B%~%b
'

function kk(){
    git checkout --track -b $1 origin/master
}

# aliases
alias reload='source ~/.zshrc'
alias gca='git commit -a'
alias ac='git commit -a --no-edit'
alias acc='git commit --no-edit'
alias ga='git add'
alias grsh='git reset --hard'
alias gc='git commit'
alias gg='grep -nri'

source ~/.hidden.zsh
