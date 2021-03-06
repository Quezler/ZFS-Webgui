#!/bin/bash
####################################################



####################################################

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
else

echo updating packages first
yum update -y

echo "copy in the latest zfs epel release"
echo "For latest release: https://github.com/zfsonlinux/zfs/wiki/RHEL-and-CentOS"
read zfs

yum install $zfs -y
gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux
echo zfs-release packages installed

echo switching from dkms to kABI-tracking kmod


fi