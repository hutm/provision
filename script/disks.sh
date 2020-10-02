#!/bin/bash
set -ex

for disk in b c d e f g h j k
do
 dev=/dev/sd${disk}
 media=/media/sd${disk}
 if [ -e $dev ]
 then
     mkfs.xfs -f $dev
     mkdir -p ${media}
     echo "${dev} ${media}   xfs    defaults,nobootwait        0       2" >> /etc/fstab
     mount ${dev}
     chmod 777 ${media}
 fi
done

