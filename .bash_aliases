alias rebash="source ~/.bashrc"

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
