#!/usr/bin/env fish

if type -q atuin
	set_color --bold
	echo Logging in to atuin...
	set_color normal
	atuin login
end
