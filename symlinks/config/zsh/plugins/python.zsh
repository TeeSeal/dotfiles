alias py="python3"
alias django="py manage.py"
alias pyvenv="source .venv/bin/activate"

function activate_python_venv() {
    if [[ -d ./.venv ]] ; then
        source ./.venv/bin/activate
    elif [[ -v VIRTUAL_ENV ]] ; then
        parentdir="$(dirname "$VIRTUAL_ENV")"
        if [[ "$PWD"/ != "$parentdir"/* ]] ; then
            deactivate
        fi
    fi
}

activate_python_venv
chpwd_functions+=("activate_python_venv")
