#!/usr/bin/env bash
	# We are using FUNCNAME which blocks POSIX compatibility
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)

# Uses bash for FUNCNAME otherwise optimized for shell

: '
Output error message and exits depending on the input

Usage: die EXITCODE MESSAGE

Exit codes are based on available informations
- http://tldp.org/LDP/abs/html/exitcodes.html#EXITCODESREF

Exit codes (EXITCODE):
	0       True (will not exit)
	1       False
	2       Syntax error
	3       Permission error
	126     Not executable
	130     Killed by end-user
	255     Unexpected result

Exit code 255 is used to handle if statement logic for runtime quality assurance alike:

if [ -e file ]; then
	action
elif [ ! -h file ]; then
	action
else
	die 255 "Checking for file"
fi

Notice that in this case no all posibilities are covered so if file is a symlink the else is supposed to trigger informing the developer to adapt logic

Message (MESSAGE) is expected to be as one argument, multiple arguments will result in an error by design'
die() {
	err_code="$1"
	message="$2"
	syntax_err="$3"

	# Output error if more then expected arguments is parsed
	[ -n "$syntax_err" ] && printf 'ERROR: %s\n' "Unexpected argument has been parsed in die"

	# Used to customize the output can be set in $pckmdir/bashrc i.e: /etc/paludis/bashrc
	[ -z "$en_die_output" ] && en_die_output="FATAL(${FUNCNAME[1]}):"
	[ -z "$cz_die_output" ] && cz_die_output="FATALNÍ(${FUNCNAME[1]}):"
	[ -z "$sk_die_output" ] && sk_die_output="ČOBOLO(${FUNCNAME[1]}):"
	#                                         ^^^^^^ - Now we wait for angry čobolaks
	[ -z "$general_die_output" ] && general_die_output="FATAL(${FUNCNAME[1]}):"

	# HELPER: Handle die output to avoid duplicate
	die_output() {
		if [ -n "$message" ]; then
			case $LANG in
				en*) printf "$en_die_output %s\\n" "$message" 1>&2 ;;
				cz*) printf "$cz_die_output %s\\n" "$message" 1>&2 ;;
				sk*) printf "$cz_die_output %s\\n" "$message" 1>&2 ;;
				*) printf "$general_die_output %s\\n" "$message" 1>&2
			esac
		elif [ -z "$message" ]; then
			die_message
		else
			printf 'FATAL: Unexpected happend in die error code - %s\n' "$err_code"
		fi

		exit "$err_code"
	}

	case "$err_code" in
		0|true) true ;;
		1|false) # False
			die_message() {
				case $LANG in
					en*) printf "$general_die_output %s\\n" "Function $MYFUNCNAME returned false" ;;
					*) printf "$general_die_output %s\\n" "Function $MYFUNCNAME returned false"
				esac
			}; die_output ;;
		2) # Syntax err
			die_message() {
				case $LANG in
					en*) printf "$general_die_output %s\\n" "Function $MYFUNCNAME returned $err_code" ;;
					*) printf "$general_die_output %s\\n" "Function $MYFUNCNAME returned $err_code"
				esac
			}; die_output ;;
		3) # Permission issue
			die_message() {
				case $LANG in
					en*) printf "$general_die_output %s\\n" "Unable to elevate root access from $(id -u)" ;;
					*) printf "$general_die_output %s\\n" "Unable to elevate root access from $(id -u)"
				esac
			}; die_output ;;
		126) # Not executable
			die 126 "FIXME(die): Not executable" ;;
		130) # Killed by user
			die 130 "Killed by user" ;;
		wtf|255) # Custom
			die_message() {
				case $LANG in
					en*) printf "$general_die_output %s\\n" "Unexpected result in '$message'" ;;
					*) printf "$general_die_output %s\\n" "Unexpected result in '$message'"
				esac
			}; die_output ;;
		# Used for development
    ping) printf "$general_die_output %s\\n" "Killed by ping\n" ; exit 1 ;;
		# In case error code is not provided
		fixme)
			printf 'FIXME: %s\n' "$message"
			exit 1 ;;
		*)
			printf 'ERROR: %s\n' "die without error code has been provided"
			printf "$general_die_output %s\\n" "$err_code" 1>&2 ; exit 1
	esac

	unset err_code message
}
