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
  zsh-syntax-highlighting
  zsh-autosuggestions
  bartboy011/cd-reminder
  MikeDacre/cdbk
  gretzky/auto-color-ls
  rsync
  svn-fast-info
EOBUNDLES

antigen apply

[[ -f ~/.aliasses ]] && source ~/.aliasses

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
