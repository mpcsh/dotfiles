function fish_prompt
	# save exit status so it's not clobbered by successful commands below
	set -l exit_code $status
	set -l hostname_prefix ""
	set -l directory_prefix ""

	# if we're not who we logged in as, display the username
	if [ (whoami) != "mpcsh" ]
		set hostname_prefix "at "
		set directory_prefix "in "

		if [ (whoami) = "root" ]
			set_color red
		else
			set_color yellow
		end

		printf "%s " (whoami)
		set_color normal
	end

	# if we're ssh'ed, display the hostname
	if test -n "$SSH_CONNECTION"
		set directory_prefix "in "

		set_color yellow
		printf "%s%s " $hostname_prefix (hostname)
		set_color normal
	end

	# print PWD - git status includes a prefix space, so don't print a suffix one here
	set_color blue
	printf "%s%s " $directory_prefix (prompt_pwd)
	set_color normal

	# prompt char - red if previous command failed
	if test $exit_code -ne 0
		set_color red
	end
	printf "» "
	set_color normal
end

function fish_right_prompt
	# git status
	set_color purple
	printf "%s" (__fish_git_prompt)
	set_color normal
end
