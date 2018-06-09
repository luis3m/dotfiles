echo -e "\n========================================="
echo -e "    installing git"
echo -e "=========================================\n"

cd
sudo apt install git

echo -e "\n========================================="
echo -e "    generating ssh key"
echo -e "=========================================\n"

ssh-keygen -t rsa -b 4096 -C "luis3m.23@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
sudo apt install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub

echo -e "\n========================================="
echo -e "    installing curl"
echo -e "=========================================\n"

sudo apt install curl

echo -e "\n========================================="
echo -e "    installing NodeJs"
echo -e "=========================================\n"

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs
sudo apt install -y build-essential

echo -e "\n========================================="
echo -e "    installing gulp"
echo -e "=========================================\n"

sudo npm install -g gulp

echo -e "\n========================================="
echo -e "    installing Java"
echo -e "=========================================\n"

sudo add-apt-repository ppa:webupd8team/java
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install oracle-java8-set-default
sudo apt-get install oracle-java10-installer
sudo apt-get install oracle-java10-set-default

echo -e "\n========================================="
echo -e "    installing SBT"
echo -e "=========================================\n"

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt update
sudo apt install sbt

echo -e "\n========================================="
echo -e "    installing dotnet core"
echo -e "=========================================\n"

sudo apt-key adv --keyserver packages.microsoft.com --recv-keys EB3E94ADBE1229CF
sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-bionic-prod bionic main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt update
sudo apt install dotnet-sdk-2.1.105

echo -e "\n========================================="
echo -e "    installing Elm"
echo -e "=========================================\n"

sudo npm install -g elm

echo -e "\n========================================="
echo -e "    installing emacs"
echo -e "=========================================\n"

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs25

echo -e "\n========================================="
echo -e "    installing spacemacs"
echo -e "=========================================\n"

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

echo -e "\n========================================="
echo -e "    installing fonts"
echo -e "=========================================\n"

FONT_HOME=~/.local/share/fonts

mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"

(git clone \
   --branch release \
   --depth 1 \
   'https://github.com/adobe-fonts/source-code-pro.git' \
   "$FONT_HOME/adobe-fonts/source-code-pro" && \
fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro")

echo -e "\n========================================="
echo -e "    installing zsh"
echo -e "=========================================\n"

sudo apt install zsh
sudo chsh -s $(which zsh)

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

echo -e "\n========================================="
echo -e "    installing SpaceVim"
echo -e "=========================================\n"

curl -sLf https://spacevim.org/install.sh | bash

echo -e "\n========================================="
echo -e "    installing vim-plug"
echo -e "=========================================\n"

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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

