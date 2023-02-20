# vimrc-config
This consists config for my vim file . I have shifted to nvim but i am currently using vim files for config. Telescope doesn't work in VIM , hence it is included in init.vim which is loaded for nvim so if you want to use the vim file , it wouldn't crash . You can still use CTRL-P(plugin) to search for files in your directory. Personally i prefer telescope , hence i shifted to nvim.

PS: I will be rewriting the config in lua once i am happy with my vim configuration.

my vimrc config

Purpose of 2 files

1. **vimrc_backup** : Consists vim config . Paste it in your ~/.vimrc . Mainly configured for **python, javascript and c++**. Can be extended for other languages using Coc.vim.
                      There are some macOs specific config which have been commented out and few added for mac specifically(comments have been added for those). This has been tested on mac and linux(ubuntu).
                      Remember: Telescope doesn't work with vim , only compatible with neovim.
                      
2. **nvim-init.vim** : I recently shifted to neovim hence it first loads the vimrc and then loads some configuration for telescope. Put this file in ~/.config/nvim/init.vim.

