" Vim syntax file
" Language: logrotate

" Quit if a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

syn region logRotateScript matchgroup=logRotateKeyword start="\s*\<firstaction\>" end="\<endscript\>" contains=NONE
syn region logRotateScript matchgroup=logRotateKeyword start="\s*\<lastaction\>" end="\<endscript\>" contains=NONE
syn region logRotateScript matchgroup=logRotateKeyword start="\s*\<prerotate\>" end="\<endscript\>" contains=NONE
syn region logRotateScript matchgroup=logRotateKeyword start="\s*\<postrotate\>" end="\<endscript\>" contains=NONE
syn region logRotateScript matchgroup=logRotateKeyword start="\s*\<preremove\>" end="\<endscript\>" contains=NONE

runtime! syntax/conf.vim

" syn keyword logRotateTodo   contained TODO FIXME XXX

syn keyword logRotateKeyword  addextension allowhardlink compress compresscmd
            \ compressext compressoptions copy copytruncate create createolddir
            \ daily dateext dateformat datehourago dateyesterday delaycompress
            \ endscript extension firstaction hourly ifempty include lastaction
            \ mail mailfirst maillast maxage maxsize minage minsize missingok
            \ monthly noallowhardlink nocompress nocopy nocopytruncate nocreate
            \ nocreateolddir nodateext nodelaycompress nomail nomissingok
            \ noolddir norenamecopy nosharedscripts noshred notifempty olddir
            \ postrotate preremove prerotate renamecopy rotate sharedscripts
            \ shred shredcycles size start su tabooext taboopat uncompresscmd
            \ weekly yearly

" String
" syn region  logRotateString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
" syn region  logRotateString start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline

" syn match   logRotateComment    "^#.*" contains=logRotateTodo,logRotateString,@Spell
" syn match   logRotateComment    "\s#.*"ms=s+1 contains=logRotateTodo,logRotateString,@Spell

hi def link logRotateKeyword Keyword
" hi def link logRotateString String
" hi def link logRotateComment Comment
" hi def link logRotateTodo   Todo

hi def link logRotateScript Function

let b:current_syntax = 'logrotate'
