let g:ale_linters = {
      \   'python': ['mypy'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \    'python': [
      \         'autoflake', 'isort',
      \         'trim_whitespace','black'
      \     ],
      \    'json': [
      \         'prettier',
      \     ],
      \}

nmap <F10> :ALEFix<CR>
nmap <F2> :ALELint<CR>

" Linters configs
let g:ale_python_mypy_options = '--config-file ~/Development/senet-server/mypy.ini'
let g:ale_python_isort_options = '-rc -e --profile django --skip-glob "settings.py"'
let g:ale_python_autoflake_options = '--remove-all-unused-imports  --expand-star-imports --exclude "settings.py"'
let g:ale_python_black_options = ''

let g:ale_python_mypy_auto_pipenv = 1
let g:ale_python_black_auto_pipenv = 0
let g:ale_python_isort_auto_pipenv = 0
let g:ale_python_autoflake_auto_pipenv = 0
let g:ale_python_autoimport_auto_pipenv = 0

let g:ale_python_mypy_use_global = 0
let g:ale_python_black_use_global = 1
let g:ale_python_isort_use_global = 1
let g:ale_python_autoflake_use_global = 1
let g:ale_python_autoimport_use_global = 1

let g:ale_python_mypy_show_notes = 1

" Global linter config

let g:ale_echo_msg_format = '(%linter%) %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_change = 0

let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1

let g:ale_disable_lsp = 0


nmap <silent> <A-e> <Plug>(ale_previous_wrap)
nmap <silent> <A-r> <Plug>(ale_next_wrap)
