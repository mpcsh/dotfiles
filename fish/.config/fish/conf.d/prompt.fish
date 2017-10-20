function fish_prompt
	set -l hostname_prefix ""
	set -l directory_prefix ""

	# if we're not who we logged in as, display the username
	if [ $LOGNAME != $USER ]
		set -l hostname_prefix "at "
		set -l directory_prefix "in "

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
		set -l directory_prefix "in "

		set_color yellow
		printf "%s%s " $hostname_prefix (prompt_hostname)
		set_color normal
	end

	# print PWD - git status includes a prefix space, so don't print a suffix one here
	set_color blue
	printf "%s%s" $directory_prefix (prompt_pwd)
	set_color normal

	# git status
	set_color purple
	printf "%s" (__fish_git_prompt)
	set_color normal

	# prompt char
	printf " » "
end
