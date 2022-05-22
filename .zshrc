# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
#autoload -U colors && colors
PS1='[%n@arch %~]$ %b'

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d /tmp/zcompdump
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
	       [[ $1 = 'block' ]]; then
      echo -ne '\e[1 q'
        elif [[ ${KEYMAP} == main ]] ||
		       [[ ${KEYMAP} == viins ]] ||
		              [[ ${KEYMAP} = '' ]] ||
			             [[ $1 = 'beam' ]]; then
	    echo -ne '\e[5 q'
	      fi
      }
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
        echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[1 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Configuring colors used by 'ls' command
# https://geoff.greer.fm/lscolors/


PATH=$PATH:/home/roman/Applications


# Aliases
alias pacman="sudo pacman"
alias ls="ls -a --color --group-directories-first"
alias lsa="ls -gh"
alias untar="tar xvf"
alias albert="albert & disown"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias xdg="xdg-mime"
alias xgd="xdg-mime"
alias ciget="pirate-get -C \"peerflix %s --mpv --all -- --fs\""
alias rm="trash"


export PATH="$PATH:/home/roman/.local/bin"
export NO_AT_BRIDGE=1
eval $(dbus-launch --sh-syntax)
export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID
export LS_COLORS="di=1;34:ln=0:so=0:pi=0:ex=1;31:bd=0:cd=0:su=0:sg=0:tw=0:ow=0"
export WINEESYNC=1
export TERM=xterm-256color # Fix mouse=a in allacrity vim
export DBUS_SESSION_BUS_WINDOWID
export LC_COLLATE=C # Make .files apper on top


# Stop littering $HOME folder
# https://wiki.archlinux.org/title/XDG_Base_Directory
export LESSHISTFILE=- # Remove .lesshst file from ~
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:=${HOME}/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:=${HOME}/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:=${HOME}/.local/share}

export GRIPHOME="$XDG_CONFIG_HOME/grip"
export XAUTHORITY="$XDG_CONFIG_HOME"/.Xauthority
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
#export GNUPGHOME="$XDG_DATA_HOME"/gnupg, gpg2 --homedir "$XDG_DATA_HOME"/gnupg

setopt APPEND_HISTORY

#neofetch
