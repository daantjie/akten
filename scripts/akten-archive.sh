#!/bin/bash

## Functions
usage () {
    echo "\

        akten-archive [options]

wip
"
}

config () {
    x=`pwd`
    while [ "$x" != "/home/$(whoami)" ]; do
	find "$x" -maxdepth 1 -name .akten
	x=`dirname "$x"`
    done
}

godfather () {
    x=`pwd`
    while [ "$x" != "/home/$(whoami)" ]; do
	y=`find "$x" -maxdepth 1 -name .akten`
	if [ -n "$y" ]; then
	    echo $x
	    return 1
	fi
	x=`dirname "$x"`
    done
}

## Defaults
. `config`

## Parse arguments
while [ $# != 0 ]; do
    case "$1" in
	*)
	    ## wip
	    ;;
    esac
    shift
done
