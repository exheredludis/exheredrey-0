#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)

: '
Output a warn message

Expected to be used to warn an end-user about something important'

# Used for customization of error messages by the end-user, can be set in $pckmdir/bashrc where pckmdir is for example /etc/paludis
[ -z "$warn_output" ] && warn_output="WARN:"

printf "$warn_output %s\\n" "$1"
