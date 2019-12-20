#!/usr/bin/env bash
	# We are using an array to get parameters (blocking POSIX)
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)
# Based in part on 'src_configure' from Exheres-0 which is:
# 	Copyright (c) 2006, 2007, 2008, 2009 Ciaran McCreesh as GNU General Public License v2

: '
This phase is used for configuring source prior to compilation (i.e: Generating Makefiles using "configure")
'

# TODO: Export PFN to point in $PNVR

# Default src_configure phase
default_src_configure() {
	# In case source has configure file, run it
	if [ -f "$WORKDIR/$PFN/configure" ]; then
		# TODO: DEFAULT_SRC_CONFIGURE_PARAMS is expected to be used for parameters
		"$WORKDIR/$PFN/configure" "${DEFAULT_SRC_CONFIGURE_PARAMS[@]}" || die 1 "Default configuration of package $PNV failed"
	elif [ ! -f "$WORKDIR/$PNV/configure" ]; then
		debug "Configure file for $PFN was not found"
	else
		die 255 "src_configure - default"
	fi
}

src_configure() {
	# If src_configure is not exported, run default
	default configure
}
