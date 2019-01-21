function __git_fzf_is_in_git_repo
  command -s -q git
    and git rev-parse HEAD >/dev/null 2>&1
end

function __git_fzf_git_status
  __git_fzf_is_in_git_repo; or return
  git status --short | \
    fzf -m --preview 'git diff HEAD -- {-1}' | \
    cut -c4- | \
    sed 's/.* -> //' | \
    while read -l r
      set result $result $r
    end

  if [ -n "$result" ]
    for r in $result
      commandline -it -- (string escape $r)
      commandline -it -- ' '
    end
  end

  commandline -f repaint
end

function __git_fzf_git_branch
  __git_fzf_is_in_git_repo; or return
  git branch -a | \
    fzf -m --preview 'git la (echo {} | sed s/^..// | cut -d" " -f1)' | \
    sed 's/^..//' | cut -d' ' -f1 | \
    sed 's#^remotes/##' | \
    while read -l r
      set result $result $r
    end

  if [ -n "$result" ]
    for r in $result
      commandline -it -- (string escape $r)
      commandline -it -- ' '
    end
  end

  commandline -f repaint
end

function __git_fzf_git_tag
  __git_fzf_is_in_git_repo; or return
  git tag --list | \
    fzf -m --preview 'git show {}'| \
    while read -l r
      set result $result $r
    end

  if [ -n "$result" ]
    for r in $result
      commandline -it -- (string escape $r)
      commandline -it -- ' '
    end
  end

  commandline -f repaint
end

function __git_fzf_git_log
  __git_fzf_is_in_git_repo; or return
  git la | \
    fzf -m --reverse --preview 'git show (echo {} | grep -o "[a-f0-9]\{7,\}")' | \
    sed -E 's/.*([a-f0-9]{7,}).*/\1/' | \
    while read -l r
      set result $result $r
    end

  if [ -n "$result" ]
    for r in $result
      commandline -it -- (string escape $r)
      commandline -it -- ' '
    end
  end

  commandline -f repaint
end

# https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
function git_fzf_key_bindings -d "Set custom key bindings for git+fzf"
  bind \cg\cf __git_fzf_git_status
  bind \cg\cb __git_fzf_git_branch
  bind \cg\ct __git_fzf_git_tag
  bind \cg\ch __git_fzf_git_log
end

function fish_user_key_bindings
  fzf_key_bindings
  git_fzf_key_bindings
end
