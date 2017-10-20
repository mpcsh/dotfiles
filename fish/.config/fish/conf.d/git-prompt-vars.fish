# show info about repo status
set -g __fish_git_prompt_show_informative_status true

# git status chars
set -g __fish_git_prompt_char_stateseparator ""
set -g __fish_git_prompt_char_dirtystate " !"
set -g __fish_git_prompt_char_invalidstate " X"
set -g __fish_git_prompt_char_stagedstate " ●"
set -g __fish_git_prompt_char_untrackedfiles " ?"
set -g __fish_git_prompt_char_cleanstate ""
set -g __fish_git_prompt_char_upstream_ahead " ↑"
set -g __fish_git_prompt_char_upstream_behind " ↓"
