# interactive extensions
set -e LD_PRELOAD

if status is-interactive
    bind . 'expand-dot-to-parent-directory-path'
    bind \cS 'pet-select'
end
