#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)

: '
Output annoying fixme message informing about unimplemented feature

These messages are enabled by default and can be disabled in $pckmdir/bashrc i.e /etc/paludis/bashrc which is not recommended'

# Used for customization of error messages by the end-user, can be set in $pckmdir/bashrc where pckmdir is for example /etc/paludis
[ -z "$fixme_output" ] && fixme_output="FIXME:"

case "$1" in
	NotTested)
		# shellcheck disable=SC2154 # Variable 'ignore_fixme' is expected to be exported by the end-user
		[ -z "$ignore_fixme" ] && printf "$fixme_output %s\\n" "Command '$1' is not tested" ;;
	*)
		# shellcheck disable=SC2154 # Variable 'ignore_fixme' is expected to be exported by the end-user
		[ -z "$ignore_fixme" ] && printf "$fixme_output %s\\n" "$1"
esac
