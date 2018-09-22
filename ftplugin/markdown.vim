source ~/.config/nvim/writingft.vim

nnoremap <buffer> <space>b :w<CR>:!md2pdf %:r.pdf %<CR>
nnoremap <buffer> <space>v :!open %:r.pdf -a skim.app<CR>
