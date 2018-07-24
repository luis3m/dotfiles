echo -e "\n========================================="
echo -e "    installing oh-my-zsh"
echo -e "=========================================\n"

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "\n========================================="
echo -e "    installing nord theme on terminal"
echo -e "=========================================\n"

sudo apt install dconf-cli
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
nord-gnome-terminal/src/nord.sh
sudo rm -r nord-gnome-terminal/

echo -e "\n========================================="
echo -e "    installing Neovim"
echo -e "=========================================\n"

sudo apt install software-properties-common
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim
sudo apt install python-dev python-pip python3-dev python3-pip
pip3 install neovim --upgrade
pip install websocket-client sexpdata
pip3 install websocket-client sexpdata
npm install -g neovim

echo -e "\n========================================="
echo -e "    installing SpaceVim"
echo -e "=========================================\n"

curl -sLf https://spacevim.org/install.sh | bash
sudo apt install cmake
# ~/.SpaceVim.d/plugged/youcompleteme/install.py

echo -e "\n========================================="
echo -e "    installing vim-plug"
echo -e "=========================================\n"

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo -e "\n========================================="
echo -e "    installing Omnisharp Roslyn Http"
echo -e "=========================================\n"

wget https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.31.1/omnisharp.http-mono.tar.gz
sudo mv ./omnisharp.http-mono.tar.gz ~/.SpaceVim.d/omnisharp.http-mono.tar.gz
cd ~/.SpaceVim.d/
gunzip omnisharp.http-mono.tar.gz
mkdir omnisharp-server
tar -C ./omnisharp-server -xvf omnisharp.http-mono.tar
rm omnisharp.http-mono.tar
cd

echo -e "\n========================================="
echo -e "    installing powerline fonts"
echo -e "=========================================\n"

sudo apt install fonts-powerline
fc-cache -vf

echo -e "\n========================================="
echo -e "    installing tmux"
echo -e "=========================================\n"

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

echo -e "\n========================================="
echo -e "    installing PathPicker"
echo -e "=========================================\n"

cd /usr/local/
sudo git clone https://github.com/facebook/PathPicker.git
cd PathPicker/
sudo ln -s "$(pwd)/fpp" /usr/local/bin/fpp
cd

echo -e "\n========================================="
echo -e "    installing gnome-tweak-tool"
echo -e "=========================================\n"

sudo apt install gnome-tweak-tool

echo -e "\n========================================="
echo -e "    installing dotfiles"
echo -e "=========================================\n"

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

echo -e "\n========================================="
echo -e "    Finished !"
echo -e "=========================================\n"

