#!/bin/bash

HOSTNAME=$1
ADDRESS=$2

if [ -z "$HOSTNAME" -o -z "$ADDRESS" ]; then
  echo "$0 [hostname] [ip-address]"
  echo
  echo "The ip-address is the last octet of our subnet and can be 240..247"
  echo "Make sure that you don't double assign ip addresses. You can use the ip.sh script for that."
  exit 1
fi

if [ `id -u` -ne 0 ]; then
  echo "You have to be root or use sudo to run this script."
  echo "Try to run:"
  echo " sudo $0 $@"
  exit 1
fi

echo "* Building vm image"
vmbuilder kvm ubuntu                            \
    --suite precise                             \
    --flavour virtual                           \
    --arch i386                                 \
    --part vmbuilder.partition                  \
    --templates templates                       \
    --user chef                                 \
    -c .vmbuilder.cfg                           \
    --firstboot $PWD/first-boot.sh              \
    --hostname $HOSTNAME                        \
    -o                                          \
    --tmpfs -                                   \
    --libvirt qemu:///system                    \
    --ip 78.47.79.$ADDRESS                      \
    --dest=/var/lib/libvirt/images/$HOSTNAME

echo "* Starting vm image"
virsh autostart $HOSTNAME
virsh start $HOSTNAME
