Being an Emacs newbie, I wanted my configuration mimic my Vim setup. I was lucky
to run into [@JEG2's](https://github.com/JEG2) Emacs config - out of all other
configurations I found, it happened to be split up in the most logical
manner. My setup is heavily inspired by his, along with bits and pieces from
other people's.

Walkthrough
---------------

The initialization process is outlined in the
[init.el](https://github.com/hostsamurai/.emacs.d/blob/master/init.el). First,
it defines a function for evaluating each elisp files inside the `init`
directory. A brief explanation for each init file follows:

1. **freshen** - replaces old .elc files if newer, corresponding .el ones exist in
   the directory
2. **system** - load system-specific settings
3. **autoloads** - regenerate the autoload definitions file if any of the files in
   [functions](https://github.com/hostsamurai/.emacs.d/blob/master/hostsamurai/functions)
   is newer
4. **packages** - handles installing or removing any packages
5. **compile** - compiles any .el files in the
   [hostsamurai](https://github.com/hostsamurai/.emacs.d/blob/master/hostsamurai) directory
6. **autohooks** - autoloads everything in the
   [hooks](https://github.com/hostsamurai/.emacs.d/blob/master/hostsamurai/hooks),
   each filename representing the corresponding mode it applies to
7. **settings** - loads everything in the
   [settings](https://github.com/hostsamurai/.emacs.d/blob/master/hostsamurai/settings)
   directory, where any cosmetic or functional settings that don't fit in the
   aforementioned directories live

Installation
------------

Clone the repo and symlink to it to your home directory with `ln -sr emacs.d
~/.emacs.d/`. It's probably a good idea to move your existing .emacs.d elsewhere
prior to doing this ;)
