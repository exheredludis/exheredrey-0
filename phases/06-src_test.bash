#!/usr/bin/env bash
	# We are using an array to get parameters (blocking POSIX)
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)
# Based in part on 'src_compile' from Exheres-0 which is:
# 	Copyright (c) 2006, 2007, 2008, 2009 Ciaran McCreesh as GNU General Public License v2

: "
Phase used to test package in '$WORKDIR/$PFN'"

default_src_test() {
	# Start configuration if we have a makefile
	if [ -f "$WORKDIR/$PFN/Makefile" ]; then
		if emake -C "$WORKDIR/$PFN" -n check &>/dev/null; then
			emake -C "$WORKDIR/$PFN" check || die 1 "Tests failed for $PFN"
		elif emake -C "$WORKDIR/$PFN" -n test &>/dev/null; then
			emake -C "$WORKDIR/$PFN" test || die 1 "Tests failed for $PFN"
		else
			die 255 "src_test - running tests"
		fi
	elif [ ! -f "$WORKDIR/$PFN/Makefile" ]; then
		die 1 "Unable to find a Makefile in '$WORKDIR/$PFN', unable to run tests in for package '$PFN' in '$WORKDIR/$PFN'"
	else
		die 255 "default_src_test - Checking for Makefile"
	fi
}

src_test() {
	# If src_test is not exported, run default
	default test
}
