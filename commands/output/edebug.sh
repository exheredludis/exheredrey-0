#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)

: '
Output debug message used for development'

# Used for customization of error messages by the end-user, can be set in $pckmdir/bashrc where pckmdir is for example /etc/paludis
[ -z "$debug_output" ] && debug_output="DEBUG:"

[ -n "$DEBUG" ] && printf "$debug_output %s\\n" "$1"
