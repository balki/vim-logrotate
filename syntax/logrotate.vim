" Vim syntax file
" Language: logrotate

if exists("b:current_syntax")
    finish
endif

syntax include @logRotateSh syntax/sh.vim
unlet b:current_syntax

" FIXME:
" Whitespace is not required in actual config,
" But vim syntax region does not work if start pattern is also a keyword
" Hence added \s* below
syntax region logRotateScript matchgroup=logRotateKeyword start="\s*\<\%(firstaction\|lastaction\|prerotate\|postrotate\|preremove\)\>" end="\<endscript\>" contains=@logRotateSh

" for comments, todo, string
runtime! syntax/conf.vim

syntax keyword logRotateKeyword addextension allowhardlink compress compresscmd
            \ compressext compressoptions copy copytruncate create createolddir
            \ daily dateext dateformat datehourago dateyesterday delaycompress
            \ endscript extension firstaction hourly ifempty ignoreduplicates 
            \ include lastaction mail mailfirst maillast maxage maxsize minage 
            \ minsize missingok monthly noallowhardlink nocompress nocopy 
            \ nocopytruncate nocreate nocreateolddir nodateext nodelaycompress 
            \ nomail nomissingok noolddir norenamecopy nosharedscripts noshred 
            \ notifempty olddir postrotate preremove prerotate renamecopy 
            \ rotate sharedscripts shred shredcycles size start su tabooext 
            \ taboopat uncompresscmd weekly yearly

highlight default link logRotateKeyword Keyword

let b:current_syntax = 'logrotate'
