# Add Awesome to Ubuntu Display Manager

- This is after the package is installed and in use with nix

```
sudo nano /usr/share/xsessions/nix-awesome.desktop
```

- Paste this config into the desktop entry
- Set actual username in the Exec line

```
[Desktop Entry]
Name=Awesome (Nix)
Comment=Log into Awesome via Nix
Exec=/home/<<YOUR_USERNAME>>/.nix-profile/bin/awesome
Type=Application
DesktopNames=Awesome
X-Ubuntu-Gettext-Domain=awesome
```

## Load into awesome wm session

- Log out and back in
- Check for the gear icon while logging back in and select the awesome session

