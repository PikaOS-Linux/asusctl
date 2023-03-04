# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports
# Clone Upstream
git clone https://gitlab.com/asus-linux/asusctl -b 4.6.0-rc1
cp -rvf ./debian ./asusctl
cd ./asusctl

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p asusctl_4.6.0-rc1
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
