
if [ -d "$HOME/.bin" ]
  set PATH "$HOME/.bin:$PATH"
end

if [ -d "$HOME/.local/bin" ]
  set PATH "$HOME/.local/bin:$PATH"
end

export _JAVA_AWT_WM_NOREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/openjdk17

#set default editor to neovim
export EDITOR='nvim'

#set manpager
set -x MANPAGER "bat -p --tabs 2 --theme gruvbox-dark"

###############################################
#aliases
###############################################
alias lock='xsecurelock'

cat ~/.config/kitty/ascii_cat.txt

direnv hook fish | source
