function checkCommand {
    command -v $1 >/dev/null 2>&1 || { echo "$1 not available." >&2; exit 1; }
}
