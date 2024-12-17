# sandboxのためのbashrc

# neovim
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/nvim-linux64/bin:$PATH"

# env
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# go
# export PATH=$PATH:$HOME/go/bin
# export GOROOT=$(go env GOROOT)

alias lg='lazygit'

export PROMPT_COMMAND='history -a; history -c; history -r'
source /usr/share/doc/git/contrib/completion/git-completion.bash
