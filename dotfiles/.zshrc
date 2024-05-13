# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Install sheldon
eval "$(sheldon source)"
export LLVM_CONFIG="/opt/homebrew/Cellar/llvm@11/11.1.0_4/bin/llvm-config"
export PATH=/opt/homebrew/Cellar/llvm@11/11.1.0_4/bin/:$PATH
eval "$(brew shellenv)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

eval "$(rbenv init - zsh)"
source "$HOME/.rye/env"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
