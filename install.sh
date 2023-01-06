#!/bin/sh
mknod /dev/loop1 b 7 8
losetup /dev/loop1 /data/rootfs.img
mkdir /rootfs
mount /dev/loop1 /rootfs
cp -r ./etc/udev/rules.d/70-surya.rules /rootfs/etc/udev/rules.d/
cp -r ./etc/ofono/main.conf /rootfs/etc/ofono/
cp -r ./etc/phosh/ /rootfs/etc/
cp -r ./etc/systemd/system/phosh.service.d/90-wait.conf /rootfs/etc/systemd/system/phosh.service.d/
cp -r ./etc/systemd/system/droidian-sysfs-torch.service /rootfs/etc/systemd/system/droidian-sysfs-torch.service
cp -r ./etc/apt/sources.list.d/surya.list /rootfs/etc/apt/sources.list.d
cp -r ./usr/share/keyrings/surya.gpg /rootfs/usr/share/keyrings/surya.gpg
cp -r ./usr/share/applications/* /rootfs/usr/share/applications/
cp -r ./usr/share/icons/* /rootfs/usr/share/icons/
mkdir -p /rootfs/opt/
cp -r ./opt/droidian-sysfs-torch/ /rootfs/opt/
cp -r ./usr/bin/* /rootfs/usr/bin/
chroot /rootfs/ /bin/bash -c 'export PATH="$PATH:/usr/bin:/usr/sbin:/bin:/sbin" && systemctl enable droidian-sysfs-torch'
echo "Now just reboot"
