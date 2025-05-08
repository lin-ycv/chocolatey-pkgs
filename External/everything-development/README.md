# <img src="https://cdn.jsdelivr.net/gh/lin-ycv/chocolatey-pkgs@15c1cf0ed365761607f560b13da908c3e0f1f7e7/icons/Everything.png" width="48" height="48"/> [Everything Alpha](https://chocolatey.org/packages/everything-development)

"Everything Alpha" is the alpha release of an administrative tool that locates files and folders by filename instantly for Windows.
Unlike Windows search "Everything" initially displays every file and folder on your computer (hence the name "Everything").
You type in a search filter to limit what files and folders are displayed.  
Despite being Alpha, this release is generally stable and much more feature rich than the [standard release](https://chocolatey.org/packages/everything)

## Features

- Small installation file
- Clean and simple user interface
- Quick file indexing
- Quick searching
- Minimal resource usage
- Share files with others easily
- Real-time updating
- [More ...](https://www.voidtools.com/faq/)

## Default install behaviour

- Installs to `%APPDATA%\Everything`
- ### Enabled
  - Everything Service
  - Runs on startup
  - Adds to start menu
  - Adds to desktop
  - EFU association
  - Automatically index NTFS
- ### Not enabled
  - Does not check for updates
  - No context menu
  - No quick launch

## Install parameters

Install parameters can be found here: [https://www.voidtools.com/forum/viewtopic.php?t=5673](https://www.voidtools.com/forum/viewtopic.php?t=5673)

Example: `choco install everything-development --install-arguments="-install-options ""-uninstall-desktop-shortcut"" /D=E:\Programs\Everything"`

## Screenshot

![screenshot](https://cdn.jsdelivr.net/gh/lin-ycv/chocolatey-pkgs@15c1cf0ed365761607f560b13da908c3e0f1f7e7/External/everything-development/Screenshot.png)
