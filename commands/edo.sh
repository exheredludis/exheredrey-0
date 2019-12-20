#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)
# Based in part on 'expatch' from Exherbo Linux which is:
# 	General Public License v2

: "
Captures error code and output message accordingly

Note that edo might pass if the command used returns error code '0' like some windows programs"

efixme NotTested edo

# Capture arguments into a command variable
command="$*"

# Set in curly brackets to avoid exit if the command fails
{
	# Execute value of 'command' variable and capture error code
	"$command" || pulsecheck="Dr. McCoy: It's dead Jim"
	err_code="$?"
}

# Determine the return based on error code
case "$err_code" in
	0) true ;;
	*) die "$err_code"
esac

[ -n "$pulsecheck" ] && die 1 "Command 'edo $command' returned error code '0', but command 'edo' captured returned false"

unset err_code command
