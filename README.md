# RCFiles
A repository containing my personal rc files, dotfiles and other assorted config
related to terminal tools.

## Deployment
for the most part, once cloned it is a matter of creating symlinks to the config
files from the places that those tools expect them to be i.e.
    - `ln -s <path/to/repo>/.bashrc ~/.bashrc`
however for the nvim directory neovim expects it to be in your `~/.config`
directory:
    - `ln -s <path/to/repo>/nvim ~/.config/nvim/`
and so on.

## A note on the various configs
### tmux

### bash

### git

### vim
As I dropped VIm in favour of NeoVIm the vim setup is significantly more basic
and should only really be used as a backup in case of problems with neovim etc.
The `.vim/` directory is populated with plugins and should (at least for the most
part just work when dropped in place. If it doesnt you may have to re-download
the plugins via vundle.

So unless you can't help it try to avoid deleting the `.vim/bundle/vundle/`
directory; while were on the topic of deleting things, the `.vim/bundle/vim-snippets/`
directory contains some custom snippets that if you want to save should be moved
somewhere before deleting the directory.

### neovim
