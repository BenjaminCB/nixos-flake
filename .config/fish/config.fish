
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
setxkbmap -option caps:swapescape

#add doom to path
export PATH="$HOME/.emacs.d/bin:$PATH"

###############################################
#aliases
###############################################
alias rr='ranger'
alias sn='shutdown now'
alias rn='reboot'
alias tpush='~/git/scripts/task/task_update.sh'
alias tpull='~/git/scripts/task/task_pull.sh'
alias ll='ls -lah'
alias maple='~/git/scripts/maple_work.sh'
alias dots='git --git-dir=$HOME/.config/ --work-tree=$HOME'

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# yay as aur helper - updates everything
alias pksyua="yay -Syu --noconfirm"
alias upall="yay -Syu --noconfirm"

cat ~/.config/kitty/ascii_cat.txt
