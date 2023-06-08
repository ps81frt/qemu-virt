# Installation des paquets.

sudo apt update && sudo apt install -y qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients bridge-utils virt-viewer cpu-checker libvirt-daemon qemu qemu-system dialog whiptail

export LIBVIRT_DEFAULT_URI='qemu:///system'

kvm-ok

sudo systemctl enable --now libvirtd

sudo systemctl start libvirtd

sudo systemctl status libvirtd

lsmod | grep kvm






# Ajout du groupe et de l'utilisateur au groupe.

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

# Ajouter cette ligne a:
sudo vim /etc/libvirt/libvirtd.conf

unix_sock_group = "libvirt"

# Ajout des autorisation.

sudo usermod -a -G libvirt $USER
sudo ls -la /var/run/libvirt/libvirt-sock
sudo chown root:libvirtd /dev/kvm
sudo chown $(whoami):$(whoami) /var/run/libvirt/libvirt-sock

# Cheat sheet command

virsh list
virsh list --inactive
virsh list --all
virsh dominfo  nomdelamachine
virsh net-list --all

virsh domdisplay nomdelamachine
remote-viewer nomdelamachine

virsh edit nomdelamachine


# creer un VM


virt-install \
-n deb11 \
--description "Test VM with RHEL 6" \
--os-type=Linux \
--os-variant=rhel6 \
--ram=2048 \
--vcpus=2 \
--disk path=/var/lib/libvirt/images/deb11.img,bus=virtio,size=10 \
--graphics none \
--cdrom /var/debian-11.7.0-amd64-DVD-1.iso\
--network bridge:br0

################################################"
# Tous desinstaller
sudo apt remove --purge -y qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients bridge-utils virt-viewer sudo cpu-checker libvirt-daemon qemu qemu-system dialog whiptail

# Suppression dossier libvirt
sudo rm -rf /var/lib/libvirt
sudo apt update
sudo apt autoremove
sudo apt autoclean
