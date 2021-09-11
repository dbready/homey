# Gnome

## Extension Installation

- Extract to `~/.local/share/gnome-shell/extensions/`
- Open the `metadata.json` file inside the extension sub-folder and extract the `uuid` (not necessarily a guid) field (eg: `my-extension-v42`)
- Confirm the extracted sub-folder matches the uuid (eg `~/.local/share/gnome-shell/extensions/my-extension-v42`)
- Restart shell (can be done without reboot with `Alt+F2`, `r`, and <enter>)
- Enable the extension (easiest through Gnome-Tweaks)

## Nautilus Breadcrumbs

Gnome Nautilus use full address bar instead of breadcrumbs. Taken from [here](https://unix.stackexchange.com/questions/154106/show-address-bar-w-full-path-in-nautilus-instead-of-breadcrumbs-bar)

```
gsettings set org.gnome.nautilus.preferences always-use-location-entry true
```
