#!/bin/bash

#######Setup btrfs subvolumes and mount
#Ask for name of disk
echo Whats the name of the root disk
read rootdisk
echo Whats the name of the boot disk
read bootdisk
echo What is your root password
read rootpassword

mount /dev/$rootdisk /mnt
cd /mnt
btrfs su cr @
btrfs su cr @home
btrfs su cr @snapshots
btrfs su cr @cache
btrfs su cr @log
btrfs su cr @images
cd /
umount /mnt
mount -o compress=zstd:1,noatime,subvol=@ /dev/$rootdisk /mnt
mkdir -p /mnt/{boot,home,.snapshots,var/cache,var/log,var/lib/libvirt/images}
mount -o compress=zstd:1,noatime,subvol=@home /dev/$rootdisk /mnt/home
mount -o compress=zstd:1,noatime,subvol=@snapshots /dev/$rootdisk /mnt/.snapshots
mount -o compress=zstd:1,noatime,subvol=@cache /dev/$rootdisk /mnt/var/cache
mount -o compress=zstd:1,noatime,subvol=@log /dev/$rootdisk /mnt/var/log
mount -o compress=zstd:1,noatime,subvol=@images /dev/$rootdisk /mnt/var/lib/libvirt/images
mount /dev/$bootdisk /mnt/boot
pacman -S --noconfirm archlinux-keyring
pacstrap /mnt base vim reflector git zsh
genfstab -U /mnt >> /mnt/etc/fstab

###Post install
arch-chroot /mnt
#locale and time
ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime
hwclock --systohc
sed 's/#en_US.UTF-8/en_US.UTF8/g' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo "KEYMAP=no-latin1" >> /etc/vconsole.conf

#Mirrors and pacman
reflector --country NO --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
sed 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf
pacman -Syy

#Hostname
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

#Users and password
echo root:$rootpassword | chpasswd
useradd -m -G wheel -s /bin/zsh morten
echo morten:$rootpassword | chpasswd

#Exports
#export VISUAL=nano

