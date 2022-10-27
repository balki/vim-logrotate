vim9script
# Vim filetype plugin file
# Language: confini
#
if exists("b:did_ftplugin")
  finish
endif
b:did_ftplugin = 1

def LogrotateHelp(msg: string = expand("<cword>"))
    const searchcmd =<< trim END
        COLUMNS=80 man logrotate 2>/dev/null | 
        gawk '/^CONFIGURATION FILE DIRECTIVES/,/^SCRIPTS/' | gawk '
        /^ {7}%s/,/^[a-z]/ {
            if(firstLineDone) {
                if(/^ {7}[^ ]/ || /^[A-Z]/)
                    exit
            }
            firstLineDone = 1
            print(substr($0, 8))
        }'
    END
    printf(join(searchcmd, "\n"), expand("<cword>"))
        ->systemlist()
        ->popup_atcursor({ "padding": [0, 1, 1, 1] })
enddef

command -nargs=1 LogRt :call LogrotateHelp(<f-args>)

b:undo_ftplugin = "setlocal commentstring< formatoptions< keywordprg<"

setlocal commentstring=#\ %s formatoptions-=t formatoptions+=croql keywordprg=:LogRt
