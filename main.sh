DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://gitlab.com/asus-linux/asusctl -b 4.6.2
cp -rvf ./debian ./asusctl
cd ./asusctl

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p asusctl_4.6.2
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
