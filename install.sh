#!/bin/sh
mount /data/rootfs.img /mnt/
mknod /dev/loop1 b 7 8
losetup -d /dev/loop1
losetup /dev/loop1 /data/rootfs.img
mkdir /rootfs && mount /dev/loop1 /rootfs
cp ./etc/udev/rules.d/70-surya.rules /rootfs/etc/udev/rules.d/
cp ./etc/ofono/main.conf /rootfs/etc/ofono/
cp -r ./etc/phosh /rootfs/etc/
cp ./etc/systemd/system/phosh.service.d/90-wait.conf /rootfs/etc/systemd/system/phosh.service.d/
cp ./etc/apt/sources.list.d/surya.list /rootfs/etc/apt/sources.list.d
cp ./usr/share/keyrings/surya.gpg /rootfs/usr/share/keyrings/surya.gpg
echo "Now just reboot"
