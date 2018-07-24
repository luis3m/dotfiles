print_command()
{
  echo -e "\n========================================="
  echo -e "    installing $@"
  echo -e "=========================================\n"
}

cd

print_command alias-tips
cd $ZSH/plugins
git clone https://github.com/djui/alias-tips.git
cd

print_command stack
curl -sSL https://get.haskellstack.org/ | sh

print_command compleat
git clone git://github.com/mbrubeck/compleat.git
cd compleat
make install
cd ..
sudo rm -r compleat

print_command fasd
cd /usr/local/
sudo git clone https://github.com/clvv/fasd
cd fasd
sudo make install
cd

print_command nord theme on terminal
sudo apt install dconf-cli
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
nord-gnome-terminal/src/nord.sh
sudo rm -r nord-gnome-terminal/

print_command Neovim
sudo apt install software-properties-common
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim
sudo apt install python-dev python-pip python3-dev python3-pip
pip3 install neovim --upgrade
pip install websocket-client sexpdata
pip3 install websocket-client sexpdata
npm install -g neovim

print_command SpaceVim
curl -sLf https://spacevim.org/install.sh | bash
sudo apt install cmake
# ~/.SpaceVim.d/plugged/youcompleteme/install.py

print_command vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

print_command thefuck
sudo pip3 install thefuck

print_command Omnisharp Roslyn Http
wget https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.31.1/omnisharp.http-mono.tar.gz
sudo mv ./omnisharp.http-mono.tar.gz ~/.SpaceVim.d/omnisharp.http-mono.tar.gz
cd ~/.SpaceVim.d/
gunzip omnisharp.http-mono.tar.gz
mkdir omnisharp-server
tar -C ./omnisharp-server -xvf omnisharp.http-mono.tar
rm omnisharp.http-mono.tar
cd

print_command powerline fonts
sudo apt install fonts-powerline
fc-cache -vf

print_command tmux
sudo apt install -y automake
sudo apt install -y pkg-config
sudo apt install -y libevent-dev
sudo apt install -y libncurses5-dev

rm -fr /tmp/tmux

git clone https://github.com/tmux/tmux.git /tmp/tmux

cd /tmp/tmux

sh autogen.sh

./configure && make

sudo make install

cd -

rm -fr /tmp/tmux

print_command PathPicker
cd /usr/local/
sudo git clone https://github.com/facebook/PathPicker.git
cd PathPicker/
sudo ln -s "$(pwd)/fpp" /usr/local/bin/fpp
cd

print_command gnome-tweak-tool
sudo apt install gnome-tweak-tool

print_command dotfiles
mkdir git
cd git
git clone https://github.com/luis3m/dotfiles.git
cd dotfiles
sudo mv ~/.tmux.conf ~/.BACKUP.tmux.conf
sudo mv ~/.zshrc ~/.BACKUP.zshrc
sudo mv ~/.oh-my-zsh/themes/agnoster-custom.zsh-theme ~/.oh-my-zsh/themes/agnoster-custom-BACKUP.zsh-theme
sudo mv ~/.spacemacs ~/.BACKUP.spacemacs
sudo mv ~/.SpaceVim.d/init.toml ~/.SpaceVim.d/BACKUP-init.toml
sudo mv ~/.SpaceVim/init.vim ~/.SpaceVim/BACKUP-init.vim
sudo ln -s $PWD/.tmux.conf ~/.tmux.conf
sudo ln -s $PWD/.zshrc ~/.zshrc
sudo ln -s $PWD/agnoster-custom.zsh-theme ~/.oh-my-zsh/themes/agnoster-custom.zsh-theme
sudo ln -s $PWD/.spacemacs ~/.spacemacs
mkdir ~/.SpaceVim.d
sudo ln -s $PWD/init.toml ~/.SpaceVim.d/init.toml
sudo ln -s $PWD/init.vim ~/.SpaceVim/init.vim
cd
