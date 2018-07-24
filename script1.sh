cd

echo -e "\n========================================="
echo -e "    installing xclip"
echo -e "=========================================\n"

sudo apt install xclip

echo -e "\n========================================="
echo -e "    installing git"
echo -e "=========================================\n"

sudo apt install git

echo -e "\n========================================="
echo -e "    installing meld"
echo -e "=========================================\n"

sudo apt install meld

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

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

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
mkdir ~/.sbt/1.0/plugins
echo 'addSbtPlugin("org.ensime" % "sbt-ensime" % "2.5.1")' > ~/.sbt/1.0/plugins/plugins.sbt

echo -e "\n========================================="
echo -e "    installing dotnet core"
echo -e "=========================================\n"

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list

sudo apt install apt-transport-https
sudo apt update
sudo apt install dotnet-sdk-2.1

echo -e "\n========================================="
echo -e "    installing mono"
echo -e "=========================================\n"

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel
sudo apt install libunwind8

echo -e "\n========================================="
echo -e "    installing fsharp"
echo -e "=========================================\n"

sudo apt install fsharp

echo -e "\n========================================="
echo -e "    installing Haskell"
echo -e "=========================================\n"

sudo apt install haskell-platform
sudo apt install libtinfo-dev
sudo apt install zlib1g-dev

echo -e "\n========================================="
echo -e "    installing Elm"
echo -e "=========================================\n"

sudo npm i -g elm --unsafe-perm=true --allow-root
sudo npm install -g elm-format --allow-root --unsafe-perm=true
sudo npm install -g elm-test --allow-root --unsafe-perm=true
sudo npm install -g elm-oracle
elm-package install

echo -e "\n========================================="
echo -e "    installing postgresql"
echo -e "=========================================\n"

sudo apt install postgresql-10

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
cd ~/.emacs.d
git checkout origin develop
cd

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
