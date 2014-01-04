#################### Mastering OpenStack Controller Install ####################

export DEBIAN_FRONTEND=noninteractive
export MYSQL_ROOT_PASS=openstack
export MYSQL_HOST=controller
export MYSQL_PASS=openstack

echo "mysql-server-5.5 mysql-server/root_password password $MYSQL_ROOT_PASS" | sudo debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password $MYSQL_ROOT_PASS" | sudo debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password seen true" | sudo debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again seen true" | sudo debconf-set-selections

sudo apt-get update
sudo apt-get install -y ubuntu-cloud-keyring vim git ntp openssh-server
sudo echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu precise-updates/havana main" | sudo tee /etc/apt/sources.list.d/havana.list
sudo apt-get install python-software-properties -y
sudo apt-get update && apt-get upgrade -y

rm /etc/hosts

echo "127.0.0.1 localhost
172.16.0.10 controller.local controller
172.16.0.11 compute1.local compute1
" > /etc/hosts

# Install NTP while we are here
echo "ntpdate controller
hwclock -w" | sudo tee /etc/cron.daily/ntpdate
chmod a+x /etc/cron.daily/ntpdate

