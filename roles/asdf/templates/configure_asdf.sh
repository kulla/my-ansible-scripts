export ASDF_DATA_DIR='{{ user.homedir }}/.local/share/asdf'

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
. <(asdf completion bash)
