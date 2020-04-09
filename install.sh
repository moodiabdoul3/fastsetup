#!/bin/bash
echo "update os"
apt-get -y update
echo "upgrade os"
apt-get -y upgrade

echo "install dependenci"

sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs

echo "install go ,if it not installed"
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)
			echo "Installing Golang"
					wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
					sudo tar -xvf go1.13.4.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac
done
fi
mkdir ~/tools
cd ~/tools
echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
echo "done"

echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "done"

echo "installing gau"
go get -u github.com/lc/gau
echo "done"

echo "installing gowitness"
echo "done"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "intalling httprobe"
go get -u github.com/tomnomnom/httprobe
echo "done"

echo "installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl
echo "done"

echo "installing hakrawler"
go get github.com/hakluke/hakrawler
echo "done"

echo "installing ffuf"
go get github.com/ffuf/ffuf
echo "done"

echo "installing dnsprobe"
go get -u -v github.com/projectdiscovery/dnsprobe
echo "done"

echo "installing seclist"
git clone https://github.com/danielmiessler/SecLists.git
echo "done"

echo "installing fuzzdb"
git clone https://github.com/fuzzdb-project/fuzzdb.git --depth 1

echo "installations finished"
