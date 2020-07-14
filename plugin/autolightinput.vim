let g:auto_light_input_data_dir="/tmp/autolightinputdata/"

fu! AutoLightInputEdit()
  if !isdirectory(g:auto_light_input_data_dir)
    call mkdir(g:auto_light_input_data_dir, 'p')
  endif
  let l:data_fname=g:auto_light_input_data_dir . expand('%:r') . "_data.in"
  execute 'edit ' . l:data_fname
endfu

fu! AutoLightInputRun()
  let l:data_fname=g:auto_light_input_data_dir . expand('%:r') . "_data.in"
  exe "silent w"
  if &filetype == 'python'
    exe "!python % < " . l:data_fname  
  elseif &filetype == 'c' || &filetype == 'cpp'
    let l:bin_file = g:auto_light_input_data_dir  .expand('%:r')
    exe "silent !rm -rf " . l:bin_file
    exe "silent !g++ -std=c++14 % -o " . l:bin_file
    exe "!" . l:bin_file . "< " . l:data_fname
    exe "silent !rm -rf " . l:bin_file
  elseif &filetype == 'java'
    let l:bin_file = g:auto_light_input_data_dir  .expand('%:r')
    exe "silent !javac % -d " . g:auto_light_input_data_dir
    exe "!java -classpath " . g:auto_light_input_data_dir . ' ' . expand('%:r') . ' < ' . l:data_fname
    exe "silent !rm -rf " . l:bin_file . ".class"
  else
    echo "The filetype is not currently supported, but only c:cpp:python:java."
  endif
endfu

command! -nargs=0 AutoLightInputEdit call AutoLightInputEdit()
command! -nargs=0 AutoLightInputRun  call AutoLightInputRun()
