autoload -U promptinit; promptinit
prompt pure

clear && 
fastfetch

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey '^H' backward-kill-word
