# Dotfiles System Config Files

Stow a single package:
```bash
stow <directory>
```

Use the stow-all script to stow all packages
```bash
./stow-all.sh
```

Use the `stow` package to manage symlinks from this repo to system locations
```bash
stow -t ~ */ # setup all symlinks
```
