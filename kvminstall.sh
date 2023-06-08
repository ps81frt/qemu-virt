sudo apt update && sudo apt install -y qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients bridge-utils virt-viewer cpu-checker libvirt-daemon qemu qemu-system dialog whiptail
export LIBVIRT_DEFAULT_URI='qemu:///system'
kvm-ok
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd
lsmod | grep kvm
sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER
sudo getent group | grep libvirt
sudo getent group | grep libvirtd
sudo groupadd --system libvirt
sudo usermod -a -G libvirt $(whoami)
sudo adduser `id -un` libvirtd
sudo adduser `id -un` kvm
newgrp libvirt
id $(whoami)
groups
sudo usermod -a -G libvirt $USER
sudo ls -la /var/run/libvirt/libvirt-sock
sudo chown $(whoami):libvirt /dev/kvm
sudo chown $(whoami):$(whoami) /var/run/libvirt/libvirt-sock
