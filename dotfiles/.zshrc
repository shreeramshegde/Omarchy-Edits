# =============================================================================
# ZSH CONFIGURATION (HyDE-Style + Omarchy)
# =============================================================================

# 1. Path Management
# The capital -U ensures the PATH array keeps only unique entries (removes duplicates)
typeset -U path PATH

# 2. History Settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory      # Append to history file rather than replacing
setopt sharehistory       # Share history across multiple terminal tabs

# 3. Basic Autocompletion System
autoload -Uz compinit
compinit

# 4. Syntax Highlighting (Colors) & Autosuggestions (Grey Text)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Tell the plugin to suggest from history FIRST, and if nothing is found, use system autocompletions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# (Optional: Keep the color override if you added it earlier)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"

# 5. Omarchy Environment Compatibility (mise)
if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

# 6. HyDE-Project Configuration & Aliases
export EDITOR=nvim
export BROWSER=zen-browser

# eza & helpful aliases
alias c='clear'                                                        # clear terminal
alias l='eza -lh --icons=auto'                                         # long list
alias ls='eza -1 --icons=auto'                                         # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto'                                       # long list dirs
alias lt='eza --icons=auto --tree'                                     # list folder as tree
alias vc='code'                                                        # gui code editor
alias fastfetch='fastfetch --logo-type kitty'

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path
alias mkdir='mkdir -p'

# Uncomment to prevent searching for commands not found in package manager
# unset -f command_not_found_handler 

# =============================================================================
# KEYBINDINGS FIX
# =============================================================================
# Ensure standard behavior is enabled
bindkey -e

# Ctrl + Left/Right Arrows for jumping words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Home and End keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Delete key
bindkey "^[[3~" delete-char

# Ctrl + Backspace (Delete word backward)
bindkey "^H" backward-kill-word

# Ctrl + Delete (Delete word forward)
bindkey "^[[3;5~" kill-word

# 7. Initialize the Starship Prompt
eval "$(starship init zsh)"

# =============================================================================
# DO NOT DELETE ANYTHING BELOW THIS LINE IF CONDA IS INITIALIZED
# =============================================================================

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/shreeram/.local/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/shreeram/.local/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/shreeram/.local/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/shreeram/.local/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

