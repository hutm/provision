#!/bin/bash
set -ex

mkdir -p /media/sda
chmod 777 /media/sda

for disk in b c d e f g h j k
do
 dev=/dev/sd${disk}
 media=/media/sd${disk}
 if [ -e $dev ]
 then
     mkfs.xfs -f $dev
     mkdir -p ${media}
     if [ `cat /etc/fstab | grep $dev | wc -l` -eq 0 ] 
     then
       echo "${dev} ${media}   xfs    defaults,nofail        0       0" >> /etc/fstab
     fi
     mount ${dev}
     chmod 777 ${media}
 fi
done
