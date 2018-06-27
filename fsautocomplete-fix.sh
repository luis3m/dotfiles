echo -e "\n========================================="
echo -e "    installing FSAutoComplete"
echo -e "=========================================\n"

cd
git clone https://github.com/fsharp/FsAutoComplete
cd FSAutoComplete
./build.sh
sudo rm -r ~/.emacs.d/elpa/fsharp-*/bin/
sudo mv src/FSAutoComplete/bin/Debug/* ~/.emacs.d/elpa/fsharp-*/
cd ..
sudo rm -f FSAutoComplete/
