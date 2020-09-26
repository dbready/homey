#!/bin/bash
# Based on Taskfile (https://github.com/adriancooney/Taskfile)
set -o errexit  # quit on error
set -o nounset  # undefined is error
set -o pipefail # show last commmand in pipe to crash

function help {
    echo "$0 <task> <args>"
    echo "Tasks:"
    compgen -A function | cat -n
}

TIMEFORMAT="Task completed in %3lR"
time ${@:-help}
