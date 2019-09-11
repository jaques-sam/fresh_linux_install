source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen theme romkatv/powerlevel10k

antigen bundles <<EOBUNDLES
  git
  colored-man-pages
  colorize
  command-not-found
  fasd
  jira
  gem
  battery
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  bartboy011/cd-reminder
  MikeDacre/cdbk
  gretzky/auto-color-ls
  rsync
  svn-fast-info
EOBUNDLES

antigen apply

[[ -f ~/.aliases ]] && source ~/.aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# User defined cmds
[[ -d $HOME/.cargo/bin ]] && export PATH="$HOME/.cargo/bin:$PATH"
[[ -d $HOME/bin ]] && export PATH="$HOME/bin:$PATH"
