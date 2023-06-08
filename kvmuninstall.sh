# Tous desinstaller                                                                             
sudo apt remove --purge -y qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients
# Suppression dossier libvirt
sudo rm -rf /var/lib/libvirt
dpkg -l | grep qemu
sudo apt purge -y --auto-remove qemu-system-x86
sudo apt update -y
sudo apt autoremove -y
sudo apt autoclean -y
