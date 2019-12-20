#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)
# Based in part on 'fixme' from Exherbo Linux which is:
# 	General Public License v2

: '
Wrapper to execute default logic in a phase on demand for example:

	src_test() {
		[ ! -e file ] && rm file

		default
	}

Which is going to remove a file prior to executing default logic for tests (logic is specifies in said phase)
'

efixme NotTested default

case $1 in
	configure|compile|install) "default_src_$1" ;;
	*) die 2 "Unsupported argument has been parsed - $1"
esac
