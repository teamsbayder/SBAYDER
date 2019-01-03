#!/bin/bash
cd td 
sudo apt-get -f install 
echo "wit ...."
sudo apt-get update -y 
clear
echo " ──────────────────────────────────────────────────────────────────────────────"
echo "            Devloper : t.me/HHHHD | My Channel : t.me/botlua                   "
echo "                                                                               "
echo "┌─────────────────────────────────────────────────────────────────────────────┐"
echo "│                                                                                   │"
echo '│ m    m        #                                                                   │'
echo '│ #  m"   mmm   #   m   mmm           mmm    mmm   m   m   m mm   mmm    mmm        │'
echo '│ #m#    #"  #  # m"   #" "#         #   "  #" "#  #   #   #"  " #"  "  #"  #       │'
echo '│ #  #m  #""""  #"#    #   #          """m  #   #  #   #   #     #      #""""       │'
echo '│ #   "m "#mm"  #  "m  "#m#"         "mmm"  "#m#"  "mm"#   #     "#mm"  "#mm"       │'
echo "│                                                                                   │"
echo "│                        Channel : t.me/botlua                                      │"
echo "└─────────────────────────────────────────────────────────────────────────────┘"

sudo apt-get install git screen redis-server shc lua5.2 liblua5.2-dev lua-lgi libnotify-dev unzip tmux 

sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev libjansson* libpython-dev make unzip git redis-server g++ -y --force-yes

wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz

tar zxpf luarocks-2.2.2.tar.gz

cd luarocks-2.2.2

./configure; sudo make bootstrap

sudo luarocks install luasocket

sudo luarocks install luasec

sudo luarocks install redis-lua

sudo luarocks install ansicolors

sudo luarocks install serpent

cd ..

sudo apt-get install curl -y

rm -fr luarocks-2.2.2.tar.gz

rm -fr install.sh

sudo add-apt-repository ppa:ubuntu-toolchain-r/test  

sudo apt-get update 

apt-get upgrade 

sudo apt-get install libconfig++9v5 libstdc++6 

sudo apt autoremove 

wget https://valtman.name/files/telegram-bot-170904-nightly-linux

mv telegram-bot-170904-nightly-linux telegram-bot

chmod +x telegram-bot

rm -fr telegram-bot-170904-nightly-linux

sudo service redis-server start

wget http://botlua.tk/victor.sh

wget http://botlua.tk/fix.sh

sudo chmod +x fix.sh

sudo chmod go-r fix.sh

sudo chmod +x victor.sh

sudo chmod 777 victor.sh

sudo chmod 777 fix.sh

sudo chmod go-r victor.sh

sudo chmod 777 run

sudo chmod 777 runAU

echo "Wit plz ....."

./fix.sh 

clear

echo " ──────────────────────────────────────────────────────────────────────────────"
echo "            Devloper : t.me/HHHHD | My Channel : t.me/botlua                   "
echo "                                                                               "
echo "┌─────────────────────────────────────────────────────────────────────────────┐"
echo "│                                                                                   │"
echo '│ m    m        #                                                                   │'
echo '│ #  m"   mmm   #   m   mmm           mmm    mmm   m   m   m mm   mmm    mmm        │'
echo '│ #m#    #"  #  # m"   #" "#         #   "  #" "#  #   #   #"  " #"  "  #"  #       │'
echo '│ #  #m  #""""  #"#    #   #          """m  #   #  #   #   #     #      #""""       │'
echo '│ #   "m "#mm"  #  "m  "#m#"         "mmm"  "#m#"  "mm"#   #     "#mm"  "#mm"       │'
echo "│                                                                                   │"
echo "│                        Channel : t.me/botlua                                      │"
echo "└─────────────────────────────────────────────────────────────────────────────┘"

echo "Done install"

./runAU


