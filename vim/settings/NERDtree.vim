" ---
" Nerdtree
" ---
nnoremap <silent> <C-\> :NERDTreeToggle<CR>:vertical<CR>
" Autoclose when closing last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMinimalUI=1
let NERDTreeDirArrows = 1
let NERDTreeHighlightCursorline=1
let g:NERDTreeWinSize = 30
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" ignore pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" default arrow symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" nerdtree-git-plugin symbols
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
"nnoremap <silent> <C-\> :NERDTreeToggle<CR>:vertical<CR>
