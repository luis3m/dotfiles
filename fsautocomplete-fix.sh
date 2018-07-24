echo -e "\n========================================="
echo -e "    installing FSAutoComplete"
echo -e "=========================================\n"

cd
git clone https://github.com/fsharp/FsAutoComplete
cd FsAutoComplete
./build.sh
sudo rm -r ~/.emacs.d/elpa/fsharp-*/bin/
sudo mv src/FsAutoComplete/bin/Debug/* ~/.emacs.d/elpa/fsharp-mode-*/bin/
cd ..
sudo rm -r FsAutoComplete/
cd
