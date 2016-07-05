# Ansible

This directory contains the ansible configuration that is used to configure the
Proofler servers.

To use the `hosts` file in this directory you can use the `ansible` wrapper
script.

# Setup your ssh config

Ansible does everything over SSH, that's why you need to setup your
`~/.ssh/config` properly.

Assuming your username is `foobar`.

```
Host 92.51.145.160 92.51.145.161
  User foobar
  Port 42523
```

Note: Obviously this does not scale. If we add new hosts everyone would have to
adjust his ssh config. Naming the servers might be an option to solve this.

# Example

> ./ansible all -m ping
