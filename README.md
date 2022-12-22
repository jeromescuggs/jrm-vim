# jrm-vim aka neoshim 

this is the transitional repository for my ~~vim~~ configuration. 

## operation

```
git clone https://github.com/jeromescuggs/jrm-vim
jrm-vim/jrm-vim.sh
jrm-vim/jrm-vim.sh nvim 
```

the first command grabs the repo. the second installs `vimrc` to `$HOME/.vim`, as well as vim-plug. running `jrm-vim.sh` again with the `nvim` flag will create a "shim" at `$HOME/.config/nvim/init.vim`: 

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/vimrc
```

**this is messy and is not recommended for a "starter" neovim configuration.**

my current go-to IDE config for neovim is [NvChad](https://github.com/NvChad/NvChad). it takes advantage of neovim's LSP integration. however, it's almost overkill for the times when i just need a pleasant platform to write from, so this repo is just for setting up a quick and dirty config for writing. 


