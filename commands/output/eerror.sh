#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)

: '
Used to handle various error messages

Expected to output an error message for non-fatal errors'

# Used for customization of error messages by the end-user, can be set in $pckmdir/bashrc where pckmdir is for example /etc/paludis
[ -z "$error_output" ] && error_output="ERROR:"

printf "$error_output %s\\n" "$1"
