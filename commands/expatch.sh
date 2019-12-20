#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)
# Based in part on 'expatch' from Exherbo Linux which is:
# 	General Public License v2

: "
Wrapper used to execute 'patch' command which applies patches to source

Usage: expatch [path/to/file.{diff,patch}] [path/to/target]

TODO
- Expecting to pipe patch in expatch
- Expecting expatch to patch whole directory or just one file depending on input of path"

die fixme "expatch is not implemented"

efixme NotTested expatch

if command -v patch 2>/dev/null; then
	patch -r -i "$1" || die "Pa"
elif command -v patch 2>/dev/null; then
	die 126 "Command 'patch' is not executable on this system, unable to patch $1"
else
	die 255 "checking for patch command"
fi
