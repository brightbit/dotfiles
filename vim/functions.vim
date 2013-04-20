function! UpdateTags()
  if exists('b:git_dir')
    call system('cd "'.b:git_dir.'/.." && nice /usr/local/bin/ctags --tag-relative -R -f .git/tags --exclude=.git --langmap="ruby:+.rake.builder.rjs" .')
  endif
endfunction

" Generate .git/tags (ctags) automatically on save
" autocmd BufWritePost * call UpdateTags()

" Set colorcolumn to the current textwidth or fallback to the specified column.
function! ColorColumnAtTextWidth(column)
  if &textwidth > 0
    execute ':set cc=' . &textwidth
  else
    execute ':set cc=' . a:column
  endif
endfunction

" Set colorcolumn to the current textwidth or fallback to 140
autocmd BufWinEnter * call ColorColumnAtTextWidth(140)
