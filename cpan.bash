# shellcheck shell=bash disable=2034

cpan-module() {
  modules=$COMPLETE_SHELL_CACHE/cpan
  [[ -f $modules ]] || {
    hint "Can't find CPAN modules cache file: '$modules'."
    hint "Try 'complete-shell install cpan'."
    return 0
  }

  local fzf_options=(
    '--layout=reverse'
    '--multi'
    '--height=0'
    '--color=bw'
    '--bind=space:toggle-down,ctrl-space:up+toggle,del:deselect-all+top'
  )

  (echo; cat "$modules") | complete-shell-pager
}
