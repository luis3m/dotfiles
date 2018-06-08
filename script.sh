echo "\n========================================="
echo "    installing git"
echo "=========================================\n"

cd
sudo apt install git

echo "\n========================================="
echo "    generating ssh key"
echo "=========================================\n"

ssh-keygen -t rsa -b 4096 -C "luis3m.23@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
sudo apt install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub

echo "\n========================================="
echo "    installing curl"
echo "=========================================\n"

sudo apt install curl

echo "\n========================================="
echo "    installing NodeJs"
echo "=========================================\n"

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs
sudo apt install -y build-essential

echo "\n========================================="
echo "    installing emacs"
echo "=========================================\n"

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs25

echo "\n========================================="
echo "    installing spacemacs"
echo "=========================================\n"

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

echo "\n========================================="
echo "    installing fonts to $FONT_HOME"
echo "=========================================\n"

FONT_HOME=~/.local/share/fonts

mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"

(git clone \
   --branch release \
   --depth 1 \
   'https://github.com/adobe-fonts/source-code-pro.git' \
   "$FONT_HOME/adobe-fonts/source-code-pro" && \
fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro")

echo "\n========================================="
echo "    installing zsh"
echo "=========================================\n"

sudo apt install zsh
sudo chsh -s $(which zsh)

echo "\n========================================="
echo "    installing oh-my-zsh"
echo "=========================================\n"

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "\n========================================="
echo "    installing nord theme on terminal"
echo "=========================================\n"

sudo apt install dconf-cli
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
/nord-gnome-terminal/src/nord.sh
sudo rm -f nord-gnome-terminal/

echo "\n========================================="
echo "    installing Neovim"
echo "=========================================\n"

sudo apt install software-properties-common
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim
sudo apt install python-dev python-pip python3-dev python3-pip
pip3 install neovim --upgrade

echo "\n========================================="
echo "    installing SpaceVim"
echo "=========================================\n"

curl -sLf https://spacevim.org/install.sh | bash

echo "\n========================================="
echo "    installing vim-plug"
echo "=========================================\n"


curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "\n========================================="
echo "    installing powerline fonts"
echo "=========================================\n"

sudo apt install fonts-powerline
fc-cache -vf

echo "\n========================================="
echo "    installing tmux"
echo "=========================================\n"

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

echo "\n========================================="
echo "    installing PathPicker"
echo "=========================================\n"

cd /usr/local/
sudo git clone https://github.com/facebook/PathPicker.git
cd PathPicker/
sudo ln -s "$(pwd)/fpp" /usr/local/bin/fpp
cd

echo "\n========================================="
echo "    installing dotfiles"
echo "=========================================\n"

mkdir git
cd git
git clone git@github.com:luis3m/dotfiles.git
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
sudo mkdir ~/.SpaceVim.d
sudo ln -s $PWD/init.toml ~/.SpaceVim.d/init.toml
sudo ln -s $PWD/init.vim ~/.SpaceVim/init.vim
cd

echo "\n========================================="
echo "    Finished !"
echo "=========================================\n"

