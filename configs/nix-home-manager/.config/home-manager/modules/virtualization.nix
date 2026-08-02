{ pkgs, ... }:

# To run on ubuntu, still need
#
# sudo apt install qemu-kvm libvirt-daemon-system
# sudo systemctl enable --now libvirtd
# sudo usermod -aG libvirt,kvm heath

{
  home.packages = with pkgs; [
    # KVM/QEMU
    qemu_kvm
    virt-manager
    libvirt
    virt-viewer

    # Firmware for UEFI guests
    OVMF

    # Networking tools
    bridge-utils

    # Useful virtualization utilities
    spice
    spice-gtk
    spice-protocol

    # ISO / disk utilities
    libguestfs
    guestfs-tools

    # Optional GUI management
    gnome-boxes
  ];
}
