# show info about repo status
set -x __fish_git_prompt_show_informative_status true

# git status chars
set -x __fish_git_prompt_char_stateseparator ""
set -x __fish_git_prompt_char_dirtystate " !"
set -x __fish_git_prompt_char_invalidstate " X"
set -x __fish_git_prompt_char_stagedstate " Δ"
set -x __fish_git_prompt_char_untrackedfiles " ?"
set -x __fish_git_prompt_char_cleanstate ""
set -x __fish_git_prompt_char_upstream_ahead " ↑"
set -x __fish_git_prompt_char_upstream_behind " ↓"
