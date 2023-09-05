type rtx >/dev/null 2>&1 && {
  _rtx_hook() {
    trap -- '' SIGINT;
    eval "$("/opt/homebrew/bin/rtx" hook-env -s zsh)";
    trap - SIGINT;
  }
  typeset -ag precmd_functions;
  if [[ -z "${precmd_functions[(r)_rtx_hook]+1}" ]]; then
    precmd_functions=( _rtx_hook ${precmd_functions[@]} )
  fi
  typeset -ag chpwd_functions;
  if [[ -z "${chpwd_functions[(r)_rtx_hook]+1}" ]]; then
    chpwd_functions=( _rtx_hook ${chpwd_functions[@]} )
  fi
}