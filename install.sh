#!/bin/bash

sudo id

echo '[+] Updating machine'
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt-get clean -y

echo '[+] Installing Go'
cd /tmp/
sudo wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/hacker/.profile
echo 'export PATH=$PATH:/home/hacker/go/bin' >> /home/hacker/.profile
echo 'export PATH=$PATH:/usr/local/go/bin' >> /root/.profile
echo 'export PATH=$PATH:/home/hacker/go/bin' >> /root/.profile
sudo rm -rf go1.17*
cd -


echo '[+] Installing ProjectDiscovery tools'
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

echo '[+] Installing ffuf'
go get -u github.com/ffuf/ffuf

echo '[+] Installing feroxbuster'
sudo snap install feroxbuster

echo '[+] Installing SecLists'
sudo git clone --depth 1 https://github.com/danielmiessler/SecLists.git /opt/seclists

echo '[.] Untar rockyou.txt'
cd /opt/seclists/Passwords/Leaked-Databases/
sudo tar xzvf rockyou.txt.tar.gz
cd -
sudo chmod -R 755 /opt/seclists/

echo '[+] Installing Fish Shell'
sudo apt-get install fish -y
sudo chsh -s `which fish`

sudo curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

fisher install laughedelic/pisces
fisher install rafaelrinaldi/pure

echo '[+] Setup fish'
echo 'set -g fish_user_paths "/home/hacker/go/bin" $fish_user_paths' >> /home/hacker/.config/fish/config.fish
sudo echo 'set -g fish_user_paths "/home/hacker/go/bin" $fish_user_paths' >> /root/.config/fish/config.fish

echo '[+] Update and Install vim plugins'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo '[+] Installing extra tools'
sudo apt-get install -y zip ripgrep build-essential bat nmap python3-pip


