# Bookmark Search

Opening your bookmarks made faster and fuzzier

## Functionality

Getting to chose your favorite bookmark through fuzzy finding and with the rofi GUI.

## Requirements

- `lz4` - decompress bookmarks in the lz4 format (pip)
- `firefox` - chromium is not supported
- `rofi/dmenu` - for the menu functionality and fuzzy search

## Installation

```bash
$ pip3 install lz4

$ git clone
$ cd 
$ chmod +x get_bookmarks.sh
$ ./get_bookmarks.sh
```

You can also create a `.desktop` file to be able to access the app through your favorite application launcher. An example of that would be the follwing file located in `~/.local/share/applications/bookmarks.desktop`:

```bash
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=bash '/home/Example/.scripts/get_bookmarks.sh'
Name=Search for bookmarks
Icon=search
```

## Rationale

Firefox uses the file `places.sqlite` to store it's bookmarks (and many more things). Because of that lock we are forced to use other means of getting the user's bookmarks from the browser. Apart from the built-ind database, firefox also does daily backups of the bookmarks - we can use them as the base for retrieving data.

## Images

Image here
