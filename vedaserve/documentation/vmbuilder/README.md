vmbuilder
=========

You have to have an Ubuntu system to create a new image. The required
packages are:

    sudo apt-get install python-vm-builder

To build a new virtual machine running Ubuntu 12.04.2 LTS (Precise
Pangolin), run the `vm.sh` command, which will show a help message first.

The script will build the VM in a ramdisk and should take ~1:30 minutes. At the first start, the VM installs openssh and chef. That can take another few minutes (while the VM already responds to pings).

The machine will have the user `chef` with a password set to `ubuntu`.
You **won't be** able to log into that machine using password based SSH authentication.
