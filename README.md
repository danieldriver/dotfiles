Dotfiles
========

This repository holds my settings for the command line, Git, Vim, and
other tools in Unix. They are installed in my Projects directory, in
`~/Projects/dotfiles/`.

The files include a setup script based on the simple one by [Michael
Smalley](https://github.com/michaeljsmalley/dotfiles), which creates
simlinks in the home directory to the appropriate files in the dotfiles
directory. As a precaution, the script first backs up any existing
dotfiles into a `dotfiles_old` directory.

The git-savvy bash prompt derives from [Nicolas
Gallagher](https://github.com/necolas/dotfiles). When the current
working directory is a Git repository, the prompt displays the
checked-out branch's name (or failing that, the commit SHA to which HEAD
points).

Sources
-------

In addition to the dotfiles of particular developers like those named
above, I have especially drawn on:

1. The lynda.com course on [Unix for Mac OS Users](http://www.lynda.com/Mac-OS-X-10-6-tutorials/Unix-for-Mac-OS-X-Users/78546-2.html) (Kevin Skoglund)
2. Various episodes of [vimcasts.org](http://vimcasts.org/episodes/archive) (Drew Neil)

Installation
------------

``` bash
git clone git://github.com/danieldriver/dotfiles ~/Projects/dotfiles
cd ~/Projects/dotfiles
./makesymlinks.sh
```
