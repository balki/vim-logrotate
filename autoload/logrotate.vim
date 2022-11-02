vim9script

export def LogrotateHelp(awkcmd: string, word: string)

    const searchcmd =<< trim eval END
        echo "<=== man logrotate ===>"
        COLUMNS=80 man logrotate 2>/dev/null | 
        {awkcmd} '/^CONFIGURATION FILE DIRECTIVES/,/^SCRIPTS/' | {awkcmd} '
        /^ {{7}}{word}/,false {{
            if(firstLineDone && /^ {{0,7}}[^ ]/ && !/endscript/) exit
            firstLineDone = 1
            print(substr($0, 8))
        }}'
    END
    searchcmd
        ->join("\n")
        ->systemlist()
        ->popup_atcursor({ "padding": [0, 1, 1, 1] })
enddef
