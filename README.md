# vimrc-config
my vimrc config

Purpose of 2 files

1. **vimrc_backup** : Consists vim config . Paste it in your ~/.vimrc . Mainly configured for **python and javascript**. Can be extended for other languages using Coc.vim.
                      There are some macOs specific config which have been commented out and few added for mac specifically(comments have been added for those). This has been tested on mac and linux(ubuntu).
                      Remember: Telescope doesn't work with vim , only compatible with neovim.
                      
2. **nvim-init.lua** : I recently shifted to neovim hence it first loads the vimrc and then loads some configuration for telescope. Put this file in ~/.config/nvim/init.lua.

