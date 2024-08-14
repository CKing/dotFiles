# interactive extensions
if status is-interactive
    bind . 'expand-dot-to-parent-directory-path'
    bind \cS 'pet-select'
end

if test -e ~/.asdf/asdf.fish
	source ~/.asdf/asdf.fish
end
if test -e ~/.asdf/plugins/java/set-java-home.fish
	source ~/.asdf/plugins/java/set-java-home.fish
end
