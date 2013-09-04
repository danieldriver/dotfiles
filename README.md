Dotfiles
========

This repository holds my settings for the Bourne-again shell, Git,
LaTeX, Vim, and other command-line tools. I keep them in a local
Projects directory (`~/Projects/dotfiles/`) and track the [public github
repo][dd]. Getting the latest version is a simple matter of issuing `git
pull`.

The files include a set-up script based on the one by [Michael
Smalley][ms], which creates simlinks in the home directory to the
appropriate files and folders in the dotfiles repo. As a precaution,
the script first backs up any existing dotfiles into a `dotfiles_old`
directory.

The git-savvy bash prompt derives from [Nicolas Gallagher][ng]. When the
current working directory is a Git repository, the prompt displays the
checked-out branch's name (or failing that, the commit SHA to which HEAD
points).

[dd]: https://github.com/danieldriver/dotfiles.git
[ms]: https://github.com/michaeljsmalley/dotfiles
[ng]: https://github.com/necolas/dotfiles

Sources
-------

In addition to the dotfiles of particular developers like those named
above, I have drawn on:

1. The lynda.com course on [Unix for Mac OS Users][ks] (Kevin Skoglund)
2. Online remnants of a [Vim training class][sb] (Shawn Biddle)
3. Various episodes of [vimcasts.org][dn] (Drew Neil)

[ks]: http://www.lynda.com/Mac-OS-X-10-6-tutorials/Unix-for-Mac-OS-X-Users/78546-2.html
[sb]: https://github.com/shawncplus/vim-classes
[dn]: http://vimcasts.org/episodes/archive

In Vim I consciously avoid the overuse of plugins -- let me exhaust its
internal functionality first! -- and so use neither vim-pathogen nor
vundle. Still, the following scripts ease my work in useful ways:

* [Align and AlignMaps](http://www.vim.org/scripts/script.php?script_id=294), by Charles Campbell
* [LaTeX Box](https://github.com/LaTeX-Box-Team/LaTeX-Box), by David Munger et al
* [Tabular](https://github.com/godlygeek/tabular), by Matt Wozniski
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized), by Ethan Schoonover
* [vim-pandoc](https://github.com/vim-pandoc/vim-pandoc), by David Sanson

Installation
------------

``` bash
git clone git@github.com:danieldriver/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
./makesymlinks.sh
```
