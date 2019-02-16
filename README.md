# Sweenu's custom archiso

A custom archiso with some programs installed by default and my
[setup](https://github.com/Sweenu/setup) repo present.


## Additional programs

- git
- networkmanager
- pyalpm

To run the setup:
- ansible
- fakeroot
- rsync
- python-pexpect


## Configuration changes

Kernel option for usb live boot:
`cow_spacesize=2G`


## Customized airootfs

- Enable NetworkManager by default
- Clone https://github.com/Sweenu/setup to /root
- Clone https://github.com/actionless/pikaur to /root
- Install pikaur
