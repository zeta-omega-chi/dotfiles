# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zeptoterem/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# 自动补全
zinit light zsh-users/zsh-autosuggestions
# 高亮
zinit light zdharma/fast-syntax-highlighting
# pure 主题
zinit light sindresorhus/pure
# 加载 OMZ 的 git 库
zinit snippet OMZ::lib/git.zsh
# 加载 OMZ 的 git 插件
zinit snippet OMZ::plugins/git/git.plugin.zsh
# OMZ z
zinit snippet OMZ::plugins/z/z.plugin.zsh
# cargo completion
zinit ice lucid nocompile
zinit load MenkeTechnologies/zsh-cargo-completion

zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh

### End of Zinit's installer chunk

# aliases
alias q="cd .."
alias qq="cd $OLDPWD"
alias l="exa -la"
alias ll="exa -F"
alias cls="clear"
alias neovide="neovide.exe --wsl"

# useful functions
mi() {
  mkdir "$1" && cd $_;
}

# add proxy
export hostip=$(ip route | grep default | awk '{print $3}')
export socks_hostport=7890
export http_hostport=7890
alias proxy='
    export https_proxy="http://${hostip}:${http_hostport}"
    export http_proxy="http://${hostip}:${http_hostport}"
    export ALL_PROXY="socks5://${hostip}:${socks_hostport}"
    export all_proxy="socks5://${hostip}:${socks_hostport}"
'
alias unproxy='
    unset ALL_PROXY
    unset https_proxy
    unset http_proxy
    unset all_proxy
'
alias echoproxy='
    echo $ALL_PROXY
    echo $all_proxy
    echo $https_proxy
    echo $http_proxy
'
#end proxy


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/home/zeptoterem/.local/bin"
export PATH="$PATH:/home/zeptoterem/.cargo/bin"
export PATH="$PATH:/home/zeptoterem/julia-1.10.2/bin"
proxy
