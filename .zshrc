#
#
cd $HOME
ZSH_THEME="minimal"
plugins=(git zsh-syntax-highlighting)
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
[ -s "/home/hapka/.bun/_bun" ] && source "/home/hapka/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PF_INFO="ascii title os kernel de uptime pkgs shell"
export DOTNET_ROOT=$HOME/.dotnet
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH="$PATH:$HOME/Downloads/flutter/bin"
export PATH="$PATH:$HOME/Downloads/flutter/bin/dart"
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/eww.zsh
export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'
export GTK_THEME='Adwaita:dark'
export fl='/home/hapka/.wine/drive_c/Program Files/Image-Line/FL Studio 21/'
export flkits='/home/hapka/.wine/drive_c/Program Files/Image-Line/FL Studio 21/Data/Patches/Kits/'
export flloops='/home/hapka/.wine/drive_c/Program Files/Image-Line/FL Studio 21/Data/Patches/Loops/'

# pacman aliases
alias p='sudo pacman -S'                                # install                     
alias pu='sudo pacman -Syu'                             # update                      
alias pr='sudo pacman -Rs'                              # remove                      
alias ps='sudo pacman -Ss'                              # search                      
alias pi='sudo pacman -Si'                              # info                        
alias plo='sudo pacman -Qdt'                            # list orphans                
alias pc='sudo pacman -Scc'                             # clean cache                 
alias plf='sudo pacman -Ql'                             # list files                  
alias pro='sudo pacman -Rns $(pacman -Qtdq)'            # remove orphans              

alias rm='trash'
alias cb='wl-copy'

macchina
# pfetch
