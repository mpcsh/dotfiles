#!/usr/bin/env fish

set hooks_dir (chezmoi git rev-parse -- --path-format=absolute --git-path hooks)

set_color --bold
echo Installing git hooks to $hooks_dir...
set_color normal
mkdir -p $hooks_dir

echo '#!/usr/bin/env fish

test -e /dev/tty; or exit 0
read --prompt-str \'run `chezmoi apply --refresh-externals --verbose`? [y/N] \' answer < /dev/tty > /dev/tty; or exit 0
if string match --quiet --regex \'^[Yy]\' -- $answer
	chezmoi apply --refresh-externals --verbose < /dev/tty > /dev/tty 2>&1
end' > $hooks_dir/prompt-chezmoi-apply

echo '#!/usr/bin/env fish

set hooks_dir (status dirname)
$hooks_dir/prompt-chezmoi-apply' > $hooks_dir/post-merge

echo '#!/usr/bin/env fish

test "$argv[1]" = rebase; or exit 0
set hooks_dir (status dirname)
$hooks_dir/prompt-chezmoi-apply' > $hooks_dir/post-rewrite

chmod +x $hooks_dir/prompt-chezmoi-apply $hooks_dir/post-merge $hooks_dir/post-rewrite
