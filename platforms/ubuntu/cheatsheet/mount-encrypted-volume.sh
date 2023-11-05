#!/bin/sh


sudo cryptsetup luksOpen /dev/sda1 my_encrypted_volume
sudo mkdir /media/my_device
sudo mount /dev/mapper/my_encrypted_volume /media/my_device


