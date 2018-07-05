" Description: vim tutorial file
" Last Change: 05-Jul-2018.
" Maintainer:  NORA75
" Licence: MIT
" ==============================================================================

" Command: {{{2

"---------------------------------------------------------------------------
" script local variable

let s:filedir = fnamemodify(resolve(expand('<sfile>:p')), ':p:h')
let s:filedir = strcharpart(s:filedir,0,len(s:filedir)-6)
if s:filedir !~ '\\$'
  let s:filedir .= '\'
endif
let s:filedir .= 'tutor\'
let s:tutorfile = s:filedir.'tutor.txt'
let s:tutorcopy = s:filedir.'tutorcopy.txt'

"---------------------------------------------------------------------------
" s:tutor() {{{3
func! s:tutor() abort
  exe 'silent! tabe '.s:tutorfile
  exe 'silent! saveas! '.s:tutorcopy
  exe 'aug noraTutor|au VimLeavePre * call delete('.string(s:tutorcopy).')|aug END'
  return
endfunc

"---------------------------------------------------------------------------
" noraTutor: {{{3
command! -narg=0 NoraTutor call s:tutor()
