" Description: vim tutorial file
" Last Change: 04-Jul-2018.
" Maintainer:  NORA75
" Licence: MIT

" Command: {{{1

"---------------------------------------------------------------------------
" script local variable {{{2

let s:filedir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

"---------------------------------------------------------------------------
" s:tutor() {{{2
func! s:tutor() abort
  let tutorfile = expand(substitute(s:filedir,'\Mnora\[\/\\]\zsplugin','tutor','').'/tutor.txt')
  let tutorcopy = expand(substitute(tutorfile,'tutor\.txt','','').'tutorcopy.txt')
  exe 'tabe '.tutorfile
  exe 'saveas! '.tutorcopy
  exe 'aug Itimura|au VimLeavePre * call delete('.string(tutorcopy).')|aug END'
  return
endfunc

"---------------------------------------------------------------------------
" NoraTutor {{{2
command! -narg=0 NoraTutor call s:tutor()

" vim: set fdm=marker fmr={{{,}}} fdl=0 ts=8 sts=2 sw=2 tw=0 ft=vim :}}}
