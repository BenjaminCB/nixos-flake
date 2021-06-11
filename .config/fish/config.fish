
if [ -d "$HOME/.bin" ]
  set PATH "$HOME/.bin:$PATH"
end

if [ -d "$HOME/.local/bin" ]
  set PATH "$HOME/.local/bin:$PATH"
end

export _JAVA_AWT_WM_NOREPARENTING 1

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
alias sn='shutdown now'
alias rn='reboot'
alias tpush='~/git/scripts/task/task_update.sh'
alias tpull='~/git/scripts/task/task_pull.sh'
alias ll='ls -lAh'
alias maple='~/git/scripts/maple_work.sh'
alias dots='git --git-dir=$HOME/.config/ --work-tree=$HOME'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias bat='bat --theme gruvbox-dark'
alias cht='cht.sh --shell'
alias sudo='doas'
alias mon2cam='deno run --unstable --allow-run --allow-read --allow-env ~/git/Mon2Cam/src/mod.ts'
alias ds='node ~/git/scripts/danishLetterParser/danishSearch.mjs'

# Aliases for software managment
# pacman or pm
alias pacman='doas pacman --color auto'
alias update='doas pacman -Syyu'

# yay as aur helper - updates everything
alias pksyua="yay -Syu --noconfirm"
alias upall="yay -Syu --noconfirm"

cat ~/.config/kitty/ascii_cat.txt
