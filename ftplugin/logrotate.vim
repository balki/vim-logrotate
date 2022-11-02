vim9script
# Vim filetype plugin file
# Language: logrotate
#
if exists("b:did_ftplugin")
    finish
endif
b:did_ftplugin = 1

b:undo_ftplugin = "setlocal comments< commentstring< formatoptions< omnifunc<"

var awkcmd: string 

if exists("g:logrotate_awk")
    awkcmd = g:logrotate_awk
else
    # Have to use gawk, default awk (i.e. mawk) does not support {0,7} regex syntax
    awkcmd = "gawk"
endif

if awkcmd != "disable" && executable(awkcmd)

    command -nargs=1 LogRotateHelpCmd :call g:logrotate#LogrotateHelp(awkcmd, <f-args>)
    setlocal keywordprg=:LogRotateHelpCmd
    b:undo_ftplugin = b:undo_ftplugin .. " keywordprg<"
endif

setlocal omnifunc=syntaxcomplete#Complete
setlocal comments=:# commentstring=#\ %s formatoptions-=t formatoptions+=croql
