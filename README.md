# vim-logrotate

Syntax and help for [logrotate](https://github.com/logrotate/logrotate) config files in `/etc/logrotate.d/*`

![screenshot](https://user-images.githubusercontent.com/189196/210303719-ee2269b9-1e79-48b3-a0cf-7994cb6ca077.png)

# Install

    mkdir -p ~/.vim/pack/gitpacks/start/
    git -C ~/.vim/pack/gitpacks/start clone https://github.com/balki/vim-logrotate
    vim +":helptags ALL" +"qa"

# Requirements

1. Vim installation that includes patch-8.2.4770. (Works in Ubuntu 22.10)
2. [gawk](https://www.gnu.org/software/gawk/manual/gawk.html) installed. See `g:logrotate_awk` config option to use a different awk
