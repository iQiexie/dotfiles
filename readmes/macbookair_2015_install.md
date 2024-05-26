
# Installing ArchLinux on Macbook Air 2015

SEE https://www.reddit.com/r/archlinux/comments/y3lba8/just_solved_problem_of_broadcom_wireless_not
SEE https://github.com/bitjockey42/archlinux-macbook-air-71
SEE https://youtu.be/_7600jPFihg?si=d4-N7Y9MysVGzrqI&t=213


1. Grab Grab the latest ISO from https://archlinux.org/download/
2. Burn the ISO to your USB Flash drive with Balena Etcher (https://etcher.balena.io/)

## Resize macOS partition

Shut off the machine. Hold the <kbd>cmd+R</kbd> keys and press the power button. Continue to hold it until you see the Apple logo.

Use Disk Utility to resize the Mac partition and add another one, which will be the Linux root.

### Preparing installation

#### Preparing iwd

1. Unload these modules `rmmod b43 bcma wl`
2. Reload the modules again with `modprobe wl`
3. Reload iwd `systemctl restart iwd`

#### Connecting to WiFi via iwd

1. List your devices `iwctl device list`
2. Connect to the network `iwctl --passphrase <WiFi Password> station <Device Name> connect <SSID>

Where
    - `<WiFi Password>` - Your WiFi password without `<` and `>` symbols
    - `<Device Name>` - Device name, usually `wlan0`
    - `<SSID>` - Simply your WiFi network name

If you're not sure what your network SSID is, try the following

1. Scan the WiFi networks `iwctl station <Device Name> scan`
2. List all the scanned networks `iwctl station <Device Name> get-networks`

### Performing installation

1. Run `archinstall`
2. Select your prefered settings
3. In the section `Additional settings` specify these: `base base-devel linux linux-firmware linux-headers systemd mkinitcpio broadcom-wl-dkms vim iwd lvm2`
4. Perform the install

### Post install settings

### WiFi

`/etc/iwd/main.conf`:

```
[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd

```

Enable:

```
systemctl enable --now systemd-resolved
systemctl enable --now iwd
```

Connect to the internet using `iwctl`


### Fonts for waybar icons

Install this package `otf-font-awesome` for the waybar icons to display correctly
