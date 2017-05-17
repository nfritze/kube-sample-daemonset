#!/bin/bash
if ! [ grep "^Domain = slnfsv4.com" /etc/idmapd.conf ] ; then
        sed -i 's/.*Domain =.*/Domain = slnfsv4.com/g' /etc/idmapd.conf
        apt-get update
        apt-get -f install -y
        apt-get install -y nfs-common
        nfsidmap -c
        /etc/init.d/rpcidmapd start
fi

