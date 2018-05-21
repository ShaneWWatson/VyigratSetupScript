#!/bin/bash

TMP_FOLDER=$(mktemp -d)
CONFIG_FILE='vyigrat.conf'
CONFIGFOLDER='/root/.vyigrat'
DAEMON='vyigratd'
CLI='vyigrat-cli'
PATH='/home'
COIN_NAME='Vyigrat'
PORT=33133
RPC_PORT=33134

function setup_node() {
sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade
apt-get -y install git automake build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev software-properties-common
add-apt-repository ppa:bitcoin/bitcoin
apt-get update
apt-get -y install libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libevent-dev
}

function binaries() {
  echo -e "Downloading Vyigrat binaries"
  cd /home
  wget http://vyigrat.com/vyigrat-cli
  wget http://vyigrat.com/vyigratd
  chmod +x /home/vyigrat-cli
  chmod +x /home/vyigratd
}

# Main code
clear
setup_node
binaries
