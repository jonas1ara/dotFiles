echo " "
vim --version | grep clipboard
echo " "

apt-get install vim-gtk3 -y

apt-get purge vim-common -y

apt install vim -y

apt-get purge vim-runtime -y

apt install vim vim-gtk -y

apt autoremove -y

echo " "
vim --version | grep clipboard
echo " "



