ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lambda"
# agnoster

fpath+=~/.zfunc

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(archlinux colored-man git mercurial npm rust systemd tmux z)

DEFAULT_USER="swatinem"

source $ZSH/oh-my-zsh.sh

alias mach='LANG=C PYTHON=python2 nice -n 10 python2 mach'
alias make='nice -n 10 make'
alias makes='nice -n 10 make -s --no-print-directory'
alias wms='nice -n 10 watch make -s'
#alias wms='watch "inotifywait -rqq . && make -s"'
alias gg='git grep'

alias perfrec='perf record -g --call-graph=dwarf'
# --exclude-perf'

export PATH=.:./node_modules/.bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.yarn/bin:/usr/lib/ccache/bin:$PATH

alias cargo="nice -n 10 cargo"
export RUST_BACKTRACE=1
export RUSTC_WRAPPER=sccache
export RUSTFLAGS="-C target-cpu=native"
export RUST_SRC_PATH=~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!.hg/*" --glob "!node_modules/*"'

source ~/.config/secret-envs.sh
source /usr/share/nvm/init-nvm.sh
