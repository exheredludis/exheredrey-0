#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)
# Based in part on 'emake' from Exherbo Linux which is:
# 	General Public License v2

: '
Wrapper for command "make"

Options can be parsed using MAKEOPTS in $pckmdir/bashrc (i.e: /etc/paludis/bashrc)
'

efixme NotTested emake

if command -v make 2>/dev/null; then
	make "$MAKEOPTS" "$@" || die 1 "Command 'make' failed (fixme, more info needed)"
elif ! command -v make 2>/dev/null; then
	die 1 "Command make is not executable on this system"
else
	die 255 "emake - checking for command 'make'"
fi
