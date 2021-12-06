ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)


# set proxy
. _proxySetLocal.sh
_proxySetAll
_proxyTestAll

