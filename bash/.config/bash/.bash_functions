# Set terminal tab title
title() {
  if [[ -z "$1" ]]; then
    echo "Usage: title <name>"
    echo "    title -r (resets to default dynamic title)"
    return 1
  fi

  # Set the variable that .bash_prompt renders
  if [[ "$1" == "-r" ]]; then
    unset CUSTOM_TAB_TITLE
    echo "Terminal tab title reset to default"
  else
    export CUSTOM_TAB_TITLE="$*"
    echo "Terminal tab title set to: $CUSTOM_TAB_TITLE"
  fi
}

# Custom nvim opener function
nv() {
  local open_in_dir="."
  if [[ $# -eq 1 ]]; then
	  open_in_dir=$1
  fi

  if command -v nvim &> /dev/null; then
	  nvim $open_in_dir
  else
	  echo "Neovim not installed!"
  fi
}
# Make my muscle memory for using 'vi' call my 'nv' function
alias vi='nv'
