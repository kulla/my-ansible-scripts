export PYENV_ROOT='{{ pyenv_install_dir }}'
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
