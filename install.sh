sudo apt-get update
sudo apt-get install hostapd udhcpd
echo "*** Hostapd and Udhcpd installed successfully ***"
sudo mv /etc/udhcpd.conf /etc/udhcpd.conf.bckp
sudo cp ./udhcpd.conf /etc/udhcpd.conf
sudo mv /etc/default/udhcpd /etc/default/udhcpd.conf.bckp
sudo cp ./udhcpd /etc/default/udhcpd
echo "*** Udchpd configured successfully ***"

sudo ifconfig wlan0 192.168.43.1
sudo mv /etc/network/interfaces /etc/network/interfaces.bckp
sudo cp ./interfaces /etc/network/interfaces

sudo mv /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf.bckp
sudo cp ./hostapd.conf /etc/hostapd/hostapd.conf

sudo mv /etc/default/hostapd /etc/default/hostapd.bckp
sudo cp ./hostapd /etc/default/hostapd

echo "*** Hostapd configured successfully ***"


sudo service hostapd start
sudo service udhcpd start
sudo update-rc.d hostapd enable
sudo update-rc.d udhcpd enable
sudo mv /etc/rc.local /etc/rc.local.bckp
sudo mv rc.local /etc/rc.local
echo "Type <sudo reboot> to restart the system and See Hotspot named 'DisarmHotspot' Created"