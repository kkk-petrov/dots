#
#
ZSH_THEME="bira"
plugins=(git)
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export PF_INFO="ascii title os kernel uptime pkgs shell wm"
export DOTNET_ROOT=$HOME/.dotnet
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH="$PATH:$HOME/Downloads/flutter/bin"
export PATH="$PATH:$HOME/Downloads/flutter/bin/dart"
source $ZSH/oh-my-zsh.sh
source $HOME/code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'

# pacman aliases
alias p='sudo powerpill -S'                                              # install
alias pu='sudo powerpill -Syu'                                           # update
alias pr='sudo powerpill -Rs'                                            # remove
alias ps='sudo powerpill -Ss'                                            # search
alias pi='sudo powerpill -Si'                                            # info
alias plo='sudo powerpill -Qdt'                                          # list orphans
alias pc='sudo powerpill -Scc'                                           # clean cache
alias plf='sudo powerpill -Ql'                                           # list files
alias pro='sudo powerpill -Rns $(powerpill -Qtdq)'           # remove orphans

alias rm='trash'

pfetch

# bun completions
[ -s "/home/hapka/.bun/_bun" ] && source "/home/hapka/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
