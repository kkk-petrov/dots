#
#
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin
ZSH_THEME="bira"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
source $HOME/code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PF_INFO="ascii title os kernel uptime pkgs shell wm"
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# pacman aliases
alias p='sudo powerpill -S'                                              # install
alias pu='sudo powerpill -Syu'                                           # update, add 'a' to the list of letters to update AUR packages if you use yaourt
alias pr='sudo powerpill -Rs'                                            # remove
alias ps='sudo powerpill -Ss'                                            # search
alias pi='sudo powerpill -Si'                                            # info
alias plo='sudo powerpill -Qdt'                                          # list orphans
alias pc='sudo powerpill -Scc'                                           # clean cache
alias plf='sudo powerpill -Ql'                                           # list files
alias pro='sudo plo && sudo powerpill -Rns $(powerpill -Qtdq)'           # remove orphans

alias rm='trash --trash-dir ~/Trash/'

pfetch
