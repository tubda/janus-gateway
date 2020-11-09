
# manually run this code below as lightsail instance install script
sudo apt-get update && sudo apt-get install git

cd /srv && git clone https://github.com/tubda/janus-gateway.git && cd janus-gateway

sudo chmod +x install.sh
