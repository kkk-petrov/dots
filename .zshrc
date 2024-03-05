# OMZ
ZSH_THEME="minimal"
plugins=(git zsh-syntax-highlighting)

# SOURCES
source $HOME/.bun/_bun
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/eww.zsh

# ALIASES
alias p='sudo pacman -S'                        # install       
alias pu='sudo pacman -Syu'                     # update        
alias pr='sudo pacman -Rs'                      # remove        
alias ps='sudo pacman -Ss'                      # search        
alias pi='sudo pacman -Si'                      # info          
alias plo='sudo pacman -Qdt'                    # list orphans  
alias pc='sudo pacman -Scc'                     # clean cache   
alias plf='sudo pacman -Ql'                     # list files    
alias pro='sudo pacman -Rns $(pacman -Qtdq)'    # remove orphans

alias pa='paru -S'                              # install       
alias par='paru -Rs'                            # remove        
alias pai='paru -Si'                            # info          
alias pau='paru -Sua'                           # update        
alias pas='paru -Ss'                            # search        
alias pac='paru -Scc'                           # clean cache   

alias rm='trash'
alias cb='wl-copy'
alias pp='ping 9.9.9.9'

# EXEC
macchina
