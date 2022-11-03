source $HOME/antigen.zsh

antigen use oh-my-zsh

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
  rsync
  svn-fast-info
EOBUNDLES

antigen apply

# Options
setopt CORRECT
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_IGNORE_DUPS

# Initialisation of tools are amended here upon installation...
