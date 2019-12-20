#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)

: '
Output an info message

Expected to be used to inform end-user about something essential or progress of process'

# Used for customization of error messages by the end-user, can be set in $pckmdir/bashrc where pckmdir is for example /etc/paludis
[ -z "$info_output" ] && info_output="INFO:"

printf "$info_output %s\\n" "$1"
