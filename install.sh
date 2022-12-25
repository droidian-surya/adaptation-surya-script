#!/bin/sh
mount /data/rootfs.img /mnt/
mknod /dev/loop1 b 7 8
losetup -d /dev/loop1
losetup /dev/loop1 /data/rootfs.img
mkdir /rootfs && mount /dev/loop1 /rootfs
cp -r ./etc/udev/rules.d/70-surya.rules /rootfs/etc/udev/rules.d/
cp -r ./etc/ofono/main.conf /rootfs/etc/ofono/
cp -r ./etc/phosh /rootfs/etc/
cp -r ./etc/systemd/system/phosh.service.d/90-wait.conf /rootfs/etc/systemd/system/phosh.service.d/
cp -r ./etc/apt/sources.list.d/surya.list /rootfs/etc/apt/sources.list.d
cp -r ./usr/share/keyrings/surya.gpg /rootfs/usr/share/keyrings/surya.gpg
cp -r ./usr/share/applications/* /rootfs/usr/share/applications/
cp -r ./usr/share/icons/* /rootfs/usr/share/icons/
cp -r ./opt/droidian-sysfs-torch /rootfs/opt/
cp -r ./usr/lib/ /rootfs/usr/lib/
cp -r ./usr/bin/ /rootfs/usr/
echo "Now just reboot"
