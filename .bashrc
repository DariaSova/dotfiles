alias g='git'
alias gsh='git show'
alias gcl='git clean -df && git reset --hard'
alias gst='git status -sb'
alias gbr='git branch'
alias gd='git diff'
alias gdc='git diff --cached'
alias branch-diff="!git diff $(git merge-base HEAD origin/main)"
alias ga='git add'
alias gf='git fetch'
alias glog='git log'
alias glgu='git log -u'
alias gcm='git commit -v'
alias gcmm='git commit -m'
alias gcma='git commit --amend'
alias gpm='git pull origin main'
alias grm='git rebase -i origin/main'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gch='git ch'
alias gchm='git checkout main'
alias gl='git log --name-only'
alias glgg="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'' %C(white)%s%C(reset) %C(bold white)— %an%C(reset)' --abbrev-commit"
alias glgg2="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glg="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=local"
alias be='bundle exec'
alias bi='bundle install'
alias cl='clear'
alias gbrd='git branch -D'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gria='git rebase -i --autosquash'
alias gpf='git push --force-with-lease'
alias gp='git push'
alias gpl='git pull'
alias gfm='git fetch origin main'
alias gfo='git fetch origin'

alias cat='bat'

alias prettyjson='python -m json.tool'

alias maintenance_task='bin/rails generate maintenance_task '
alias maintenance_task_enqueue='bin/rails generate maintenance_task:migration'
alias lhm='bin/rails generate lhm'

alias tmux="TERM=screen-256color-bce tmux"
export TERM="xterm-256color"

if [ ! -z $BASH ] ; then
 [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
