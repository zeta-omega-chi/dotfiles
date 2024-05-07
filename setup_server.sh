# update apt registry
sudo apt update && sudo apt upgrade -y

# install zsh and oh my zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install plugins for oh my zsh
## zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
## zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# remember to add plugins in .zshrc afterward and quit ~/.zshrc
# plugins=(
#   git
#   zsh-autosuggestions
#   zsh-syntax-highlighting
#   )

# install rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
 
# -----------------------------------------------------------------------
# install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# gdu
sudo apt install gdu

# htop
sudo apt install htop

# btm
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb
sudo dpkg -i bottom_0.9.6_amd64.deb

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# fd-find
cargo install fd-find

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# Set up fzf key bindings and fuzzy completion
# eval "$(fzf --zsh)"

# to set up rust bin, following shall be added in Dockerfile
# RUN mkdir -p ~/.cargo
# RUN echo "[source.crates-io]" > ~/.cargo/config \
#     && echo "replace-with = 'rsproxy-sparse'" >> ~/.cargo/config \
#     && echo "[source.rsproxy]" >> ~/.cargo/config \
#     && echo 'registry = "https://rsproxy.cn/crates.io-index"' >> ~/.cargo/config \
#     && echo "[source.rsproxy-sparse]" >> ~/.cargo/config \
#     && echo 'registry = "sparse+https://rsproxy.cn/index/"' >> ~/.cargo/config \
#     && echo "[registries.rsproxy]" >> ~/.cargo/config \
#     && echo 'index = "https://rsproxy.cn/crates.io-index"' >> ~/.cargo/config \
#     && echo "[net]" >> ~/.cargo/config \
#     && echo "git-fetch-with-cli = true" >> ~/.cargo/config
