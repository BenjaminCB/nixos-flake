
if [ -d "$HOME/.bin" ]
  set PATH "$HOME/.bin:$PATH"
end

if [ -d "$HOME/.local/bin" ]
  set PATH "$HOME/.local/bin:$PATH"
end

set PATH "$HOME/.cargo/bin:$PATH"
set PATH "$HOME/dotnet:$PATH"
set PATH "$HOME/git/Vieb/dist/linux-unpacked/:$PATH"
set PATH "$HOME/.local/bin:$PATH"
set PATH "$HOME/.dotnet/tools:$PATH"

export _JAVA_AWT_WM_NOREPARENTING=1
export DOTNET_HOME=/home/bcb/dotnet
export DOTNET_ROOT=/home/bcb/dotnet

#set default editor to neovim
export EDITOR='nvim'

#swap caps lock and escape key
#setxkbmap -option caps:swapescape

#set manpager
#set -x MANPAGER "nvim -c 'set ft=man' -"
set -x MANPAGER "bat -p --tabs 2 --theme gruvbox-dark"

###############################################
#aliases
###############################################
alias rr='ranger'
alias tpush='~/git/scripts/task/task_update.sh'
alias tpull='~/git/scripts/task/task_pull.sh'
alias ll='ls -lAh'
alias maple='~/git/scripts/maple_work.sh'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cht='cht.sh --shell'
alias ds='node ~/git/scripts/danishLetterParser/danishSearch.mjs'
alias lock='xsecurelock'

cat ~/.config/kitty/ascii_cat.txt
alias montocam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"
