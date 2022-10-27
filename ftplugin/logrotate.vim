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
    awkcmd = "gawk"
endif
# Have to use gawk, default awk (mawk) does not support {0,7} syntax
if executable(awkcmd)
    def LogrotateHelp(word: string)
        const searchcmd =<< trim eval END
            COLUMNS=80 man logrotate 2>/dev/null | 
            {awkcmd} '/^CONFIGURATION FILE DIRECTIVES/,/^SCRIPTS/' | {awkcmd} '
            /^ {{7}}%s/,false {{
                if(firstLineDone && /^ {{0,7}}[^ ]/ && !/endscript/) exit
                firstLineDone = 1
                print(substr($0, 8))
            }}'
        END
        printf(join(searchcmd, "\n"), word)
            ->systemlist()
            ->popup_atcursor({ "padding": [0, 1, 1, 1] })
    enddef

    command -nargs=1 LogRotateHelpCmd :call LogrotateHelp(<f-args>)
    setlocal keywordprg=:LogRotateHelpCmd
    b:undo_ftplugin = b:undo_ftplugin .. " keywordprg<"
endif

setlocal omnifunc=syntaxcomplete#Complete
setlocal comments=:# commentstring=#\ %s formatoptions-=t formatoptions+=croql
