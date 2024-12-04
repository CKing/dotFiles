function fish_greeting
	set -l context (_fish_greeting_contexts)

    if not contains ide $context
        fastfetch -l small -s title:separator:os:kernel:packages:uptime:break:board:cpu:gpu:break:processes:memory:swap:disk:wifi
    end

    _fish_greeting_powered
end


function _fish_greeting_powered
	set -l powered_msgs \
		"candy" \
		"rubber bands" \
		"a black hole" \
		"logic" \
		"electromagnetic cheese" \
		"shattered hopes and dreams" \
		"shrimps" \
		"a herd of tiny unicorns" \
		"a sentient potato" \
		"zero bugs, just features" \
		"a team of procrastinating pandas" \
		"a sentient pile of spaghetti code" \
		"blank bullets"

	set -l chosen_msg (random)"%"(count $powered_msgs)
	set -l chosen_msg $powered_msgs[(math $chosen_msg"+1")]

	printf (set_color F90)"Welcome! This terminal session is powered by %s!\n" $chosen_msg
end

function _fish_greeting_contexts
	set -l contexts (_fish_greeting_contexts_all)
	set -l uniq_contexts
	for c in $contexts
		if not contains -- "$c" $uniq_contexts
			set -a uniq_contexts "$c"
			echo "$c"
		end
	end
end


function _fish_greeting_contexts_all
	echo fish

	if test -n "$SSH_CLIENT"
		echo ssh
	end

	if test -n "$SSH_CONNECTION"
		echo ssh
	end

	if test -n "$TMUX"
		echo tmux
	end

	if test -n "$VSCODE_IPC_HOOK_CLI"
		echo ide
		echo vscode
	end

	if echo $TERMINAL_EMULATOR | grep JetBrains >/dev/null
		echo ide
		echo jetbrains
	end

	if echo $TERM_PROGRAM | grep Jetbrains >/dev/null
		echo ide
		echo jetbrains
	end
end

