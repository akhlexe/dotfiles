# dotfiles

Dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Bootstrap Ubuntu/Debian

Install the command-line packages tracked by this repository:

```bash
./install-apt-packages.sh
```

The package list is in `packages/apt.txt`. It contains system dependencies,
not configuration files or copies of binaries. This keeps installation
appropriate for the current machine and architecture while making the setup
reproducible on another Ubuntu/Debian machine.

## Apply configurations

From the repository root, install a Stow package into your home directory:

```bash
stow -t "$HOME" bash
stow -t "$HOME" tmux
stow -t "$HOME" nvim
```

Repeat the command for the configurations you want on a particular machine.
Stow creates symlinks from the repository into `$HOME`; it does not install
system packages such as `jq`.
