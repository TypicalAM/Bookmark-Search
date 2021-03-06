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
git clone https://github.com/TypicalAM/Bookmark-Search
pip3 install lz4
cd Bookmark-Search
chmod +x get_bookmarks.sh
./get_bookmarks.sh
```

You can also create a `.desktop` file to be able to access the app through your favorite application launcher. An example of that would be the follwing file located in `~/.local/share/applications/bookmarks.desktop`:

```
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

## Presentation

![gif](https://github.com/TypicalAM/Bookmark-Search/blob/main/presentation.gif)
