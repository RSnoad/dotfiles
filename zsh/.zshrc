# vim:fdm=marker

# Profiling for startup                                                     {{{1
# ==============================================================================
# Enable profiling (display report with `zprof`)

zmodload zsh/zprof

# Included scripts                                                          {{{1
# ==============================================================================

# Include common configuration
source $HOME/.commonrc

# No flow control, so C-s is free for C-r/C-s back/forward incremental search
stty -ixon

# Include completion functions
#fpath=(~/.zsh-completion $fpath)
#autoload -U compinit
#compinit


# Include Prezto, but remove unhelpful configuration
source_if_exists "$HOME/.zprezto/init.zsh"
unalias cp &> /dev/null         # Standard behaviour
unalias rm &> /dev/null         # Standard behaviour
unalias mv &> /dev/null         # Standard behaviour
unalias grep &> /dev/null       # Standard behaviour
setopt clobber                  # Happily clobber files
setopt interactivecomments      # Allow comments in interactive shells
unsetopt AUTO_CD                # Don't change directory automatically
unsetopt AUTO_PUSHD             # Don't push directory automatically


if_darwin && {
    source_if_exists "$HOME/.zshrc.darwin"

    # Link trash at ~/trash
    if [ ! -d "$HOME/trash" ]; then ln -s "$HOME/.Trash" "$HOME/trash"; fi
}

source_if_exists "$HOME/.zshrc.$(uname -n)"

