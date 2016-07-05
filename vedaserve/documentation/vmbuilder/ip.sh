#!/bin/bash

# This hack was found in a 
# [blog post](http://rwmj.wordpress.com/2010/10/26/tip-find-the-ip-address-of-a-virtual-machine/).
#
# In the comments of that blog post was mentioned that qemu is working
# on a feature to support IP queries as part of their
# [Google summer of code project](http://qemu-project.org/Google_Summer_of_Code_2013#Introduce_API_to_query_IP_addresses_for_given_domain)

echo "The following IP addresses seem to be registered:"
arp -a | grep ether | sed -e 's,^\(.*\) (\(.*\)) at .*,  \2 (\1),' | sort | grep 78