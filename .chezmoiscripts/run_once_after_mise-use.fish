#!/usr/bin/env fish

if type -q mise
	set_color --bold
	echo Installing node, deno, rust, and python with mise...
	set_color normal
	mise use -g node deno rust python
end
