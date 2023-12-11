# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
export LLVM_CONFIG="/opt/homebrew/Cellar/llvm@11/11.1.0_4/bin/llvm-config"
export PATH=/opt/homebrew/Cellar/llvm@11/11.1.0_4/bin/:$PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.post.bash"
