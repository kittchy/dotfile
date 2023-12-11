# PATH settings
PATH=$PATH:~/SCTK/bin
PATH=$PATH:~/Library/Application\ Support/pypoetry/venv/bin

PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
PATH="$HOME/.local/bin:$PATH"
KMP_DUPLICATE_LIB_OK=TRUE

eval $(/opt/homebrew/bin/brew shellenv)

export PATH=$PATH:$HOME/go/bin
