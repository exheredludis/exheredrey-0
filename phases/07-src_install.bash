#!/usr/bin/env bash
	# We are using an array to get parameters (blocking POSIX)
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)
# Based in part on 'src_compile' from Exheres-0 which is:
# 	Copyright (c) 2006, 2007, 2008, 2009 Ciaran McCreesh as GNU General Public License v2

: "
Phase used to install package from '$WORKDIR/$PFN' in '$IMAGEDIR'"

default_src_install() {
	# Start configuration if we have a makefile
	if [ -f "$WORKDIR/$PFN/Makefile" ]; then
		emake -C "$WORKDIR/$PFN" "${DEFAULT_SRC_COMPILE_PARAMS[@]}" DESTDIR="$IMAGEDIR" install || die 1 "Unable to install package $PFN in $IMAGEDIR"
	elif [ ! -f "$WORKDIR/$PFN/Makefile" ]; then
		die 1 "Unable to find a Makefile in '$WORKDIR/$PFN', unable to install in $IMAGEDIR"
	else
		die 255 "default_src_install - Checking for Makefile"
	fi
}

src_install() {
	# If src_install is not exported, run default
	default install
}
