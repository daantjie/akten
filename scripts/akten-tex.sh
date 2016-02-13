#!/bin/bash

## Functions
usage () {
    echo "\

        akten-tex [options] [<.tex file>]

latex                    Compile to PDF as LaTeX source (default)
t, tex                   Compile to PDF as TeX source
q, quiet                 Suppress echo
o=, output-dir=          Set output directory (defaults to .temp)       

"
}

## Defaults
compiler="pdflatex"
quiet=
output_dir=".temp"

tex_source=

## Parse arguments
while test $# != 0; do
    case "$1" in
	--latex)
	    compiler="pdflatex"
	    ;;
	-t|--tex)
	    compiler="pdftex"
	    ;;
	-q|--quiet)
	    quiet=1
	    ;;
	-o|--output-dir)
	    shift
	    output_dir="$1"
	    ;;
	-*)
	    usage
	    exit 1
	    ;;
	*)
	    tex_source="$1"
	    ;;
    esac
    shift
done
	    
## Assert tex_source is set
if [ -z "$tex_source" ]; then
    echo -e "\nNo (La)TeX source file given!\n"
    exit 1
fi

## Assert tex_source exists
if [ ! -f "$tex_source" ]; then
    echo -e "\n$tex_source does not exist!\n"
    exit 1
fi
