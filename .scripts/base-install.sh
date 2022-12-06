#!bin/bash

#Setup btrfs subvolumes and mount
#Ask for name of disk
echo Whats the name of the root disk
read rootdisk
echo Whats the name of the boot disk
read bootdisk

mount /dev/$rootdisk /mnt
cd /mnt
btrfs su cr @
btrfs su cr @home
btrfs su cr @snapshots
btrfs su cr @cache
btrfs su cr @log
btrfs su cr @images
cd..
umount /mnt
mount -o compress=zstad:1,noatime,subvol=@ /dev/$rootdisk /mnt
mkdir -p /mnt/{boot,home,.snapshots,var/cache,var/log,var/lib/libvirt/images}
mount -o compress=zstad:1,noatime,subvol=@home /dev/$rootdisk /mnt/home
mount -o compress=zstad:1,noatime,subvol=@snapshots /dev/$rootdisk /mnt/.snapshots
mount -o compress=zstad:1,noatime,subvol=@cache /dev/$rootdisk /mnt/var/cache
mount -o compress=zstad:1,noatime,subvol=@log /dev/$rootdisk /mnt/var/log
mount -o compress=zstad:1,noatime,subvol=@images /dev/$rootdisk /mnt/var/lib/libvrt/images
mount /dev/$bootdisk /mnt/boot
pacstrap /mnt base vim reflector git
genfstab -U /mnt >> /mnt/etc/fstab
