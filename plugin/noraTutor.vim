" Description: vim tutorial file
" Last Change: 05-Jul-2018.
" Maintainer:  NORA75
" Licence: MIT

let s:filedir = fnamemodify(resolve(expand('<sfile>:p')), ':p:h')
let s:filedir = strcharpart(s:filedir,0,len(s:filedir)-6)

if has('win32')
  let s:separator = '\'
else
  let s:separator = '/'
endif

if s:filedir !~ '\'.s:separator.'$'
  let s:filedir .= s:separator
endif
let s:filedir .= 'tutor'.s:separator
let s:tutorfile = s:filedir.'tutor'
let s:tutorcopy = s:filedir.'tutorcopy'

func! s:tutor(name) abort
  exe 'silent! tabe '.s:tutorfile.a:name.'.txt'
  exe 'silent! saveas! '.s:tutorcopy.a:name.'.txt'
  exe 'aug noraTutor|au VimLeavePre * call delete('.string(s:tutorcopy.a:name.'.txt').')|aug END'
  return
endfunc

command! -narg=0 NoraTutor1 call s:tutor('1')
command! -narg=0 NoraTutor2 call s:tutor('2')
