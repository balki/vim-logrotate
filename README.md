# vim-logrotate

Syntax and help for [logrotate](https://github.com/logrotate/logrotate) config files in `/etc/logrotate.d/*`

# Install

    mkdir -p ~/.vim/pack/gitpacks/start/
    git -C ~/.vim/pack/gitpacks/start clone https://github.com/balki/vim-logrotate
    vim +":helptags ALL" +"qa"

# Requirements

1. Vim installation that includes patch-8.2.4770. (Works in Ubuntu 22.10)
2. [gawk](https://www.gnu.org/software/gawk/manual/gawk.html) installed. See `g:logrotate_awk` config option to use a different awk
