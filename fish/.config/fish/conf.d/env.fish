# environment variables
set -gx GOPATH ~/.go
set -gx fish_user_paths $GOPATH/bin
set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -l -g ""'
set -gx FZF_DEFAULT_OPTS '--color=16,fg+:4'
set -gx FZF_CTRL_T_COMMAND 'ag --hidden --ignore .git -l -g ""'
set -gx FZF_CTRL_R_OPTS '--reverse'
set -gx fish_prompt_pwd_dir_length 0

# homebrew command not found
brew command command-not-found-init > /dev/null 2>&1; and . (brew command-not-found-init)
