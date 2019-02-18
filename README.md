# Sweenu's custom archiso

A custom archiso with some programs installed by default and my
[setup](https://github.com/Sweenu/setup) repo present.


## Additional programs

- base-devel
- git
- networkmanager
- pyalpm
- pikaur (from AUR, using itself)

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
- Create user Sweenu in wheel group
- Clone https://github.com/Sweenu/setup to /home/sweenu/
- Install pikaur
