# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
