if not status is-interactive
	return
end

set -x SSH_ASKPASS /usr/lib/seahorse/ssh-askpass
set -x SSH_ASKPASS_REQUIRE prefer

if set -q SSH_AUTH_SOCK
	return
end

if type -q gnome-keyring-daemon
	replay 'eval $(gnome-keyring-daemon -s -d -c pkcs11,secrets,ssh 2>/dev/null) && export SSH_AUTH_SOCK'
end

keychain --dir $XDG_RUNTIME_DIR --absolute --ignore-missing --agents ssh,gpg --inherit any --quiet
source $XDG_RUNTIME_DIR/.keychain/*-fish-gpg

if not set -q SSH_AUTH_SOCK || not set -q SSH_AGENT_PID
	source $XDG_RUNTIME_DIR/.keychain/*-fish
end
