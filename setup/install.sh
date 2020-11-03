sudo apt-get update
sudo apt-get upgrade
sudo apt-get update

wget -q -O - http://archives.fledge-iot.org/KEY.gpg | sudo apt-key add -

RASPBIAN_CODENAME=$(cat /etc/os-release | sed -n 's/VERSION_CODENAME=\(.*\)/\1/p')

if ! [[ $(grep -Fxq "deb  http://archives.fledge-iot.org/latest/$RASPBIAN_CODENAME/armv7l/ /" /etc/apt/sources.list) ]]
then
    sudo echo "deb  http://archives.fledge-iot.org/latest/$RASPBIAN_CODENAME/armv7l/ /" >> /etc/apt/sources.list
fi

sudo apt update
sudo apt -y install fledge fledge-gui fledge-south-sinusoid fledge-south-randomwalk