#!/bin/sh
# Created by Jacob Hrbek <kreyren@rixotstudio.cz> in 2019 under the terms of GNUv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)

: '
This function generates backend for unsupported features that are either not supported (and waiting to be implemented) or features that are deprecated

This file is expected to be sourced **FIRST** otherwise it may result in a false positive'

# Unsupported functions are generated using this
for feature in $(for file in $(find ../ -type f | tr '\n' ' '); do grep -oP '\w+\(\)' "$file" | tr '\n' ' '; done); do
    case "$file" in
        # Deprecated by 'die'
        nonfatal|is_nonfatal)
            printf '%s\n' "$feature { die deprecated \"Function ${feature%%()} is deprecated by 'die'\" ;}" ;;
        *)
            printf '%s\n' "$feature { die deprecated \"Function ${feature%%()} is deprecated by 'unknown(fixme)'\" ;}"
    esac
done