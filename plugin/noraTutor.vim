" Description: vim tutorial file
" Last Change: 04-Jul-2018.
" Maintainer:  NORA75
" Licence: MIT
" ==============================================================================

" Command: {{{2

"---------------------------------------------------------------------------
" script local variable

let s:filedir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

"---------------------------------------------------------------------------
" s:tutor() {{{3
func! s:tutor() abort
  let tutorfile = expand(substitute(s:filedir,'\MnoraTutor\[\/\\]\zsplugin','tutor','').'/tutor.txt')
  let tutorcopy = expand(substitute(tutorfile,'tutor\.txt','','').'tutorcopy.txt')
  exe 'silent! tabe '.tutorfile
  exe 'silent! saveas! '.tutorcopy
  exe 'aug noraTutor|au VimLeavePre * call delete('.string(tutorcopy).')|aug END'
  return
endfunc

"---------------------------------------------------------------------------
" noraTutor: {{{3
command! -narg=0 NoraTutor call s:tutor()
