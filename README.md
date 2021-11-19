
# EasyDocs
![Icon](https://github.com/watsonprojects/easydocs/raw/main/data/icons/64/com.github.watsonprojects.easydocs.svg)

A fast developer docs reader
![Screenshot](https://raw.githubusercontent.com/watsonprojects/easydocs/main/data/images/screenshot-1.png)
![Screenshot](https://raw.githubusercontent.com/watsonprojects/easydocs/main/data/images/screenshot-4.png)

## Doc Sources:
 - Valadoc
 - DevDocs

## Build Dependencies:
 - libarchive-dev
 - libdevhelp-dev
 - libgee-0.8-dev
 - libgranite-dev
 - libgtk-3-dev
 - libwebkit2gtk-4.0-dev
 - meson
 - valac

# Installing

<!-- <a href="https://appcenter.elementary.io/com.github.watsonprojects.easydocs"><img src="https://appcenter.elementary.io/badge.svg" height="75" /></a> -->
<!-- <a href="https://flathub.org/apps/details/com.github.watsonprojects.easydocs"><img src="https://flathub.org/assets/badges/flathub-badge-en.svg" height="75" /></a> -->

Releases are also always available as flatpaks on the [releases page](https://github.com/watsonprojects/docs/releases).

## Nightly builds

Nightly builds are handled by GitHub actions and the latest one can be found on [nightly.link](https://nightly.link/watsonprojects/easydocs/workflows/ci/main/easydocs.zip)

## Install From Source:
The following instructions should work on most debian-based systems:
```
sudo apt install libarchive-dev libdevhelp-dev libgee-0.8-dev libgranite-dev libgtk-3-dev libwebkit2gtk-4.0-dev meson valac
git clone https://github.com/watsonprojects/easydocs.git
cd easydocs
meson build --prefix=/usr
cd build
sudo ninja install && com.github.watsonprojects.easydocs
# To debug
sudo ninja install && G_MESSAGES_DEBUG=all com.github.watsonprojects.easydocs
```

To generate the flatpak package:
```
flatpak-builder build com.github.watsonprojects.easydocs.yml --user --install --force-clean
```

### Generating translation files

```bash
# after setting up meson build
cd build

# generates pot file
ninja com.github.watsonprojects.easydocs-pot

# to regenerate and propagate changes to every po file
ninja com.github.watsonprojects.easydocs-update-po
```