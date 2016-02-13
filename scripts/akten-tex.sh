#!/bin/bash

## Functions
usage () {
    echo "\

        akten-tex [options] [<.tex file>]

latex                    Compile to PDF as LaTeX source (default)
t, tex                   Compile to PDF as TeX source
o=, output-dir=          Set output directory (defaults to .temp)

"
}

## Defaults
compiler="pdflatex"
output_dir=".temp"

tex_source=

## Parse arguments
while [ $# != 0 ]; do
    case "$1" in
	--latex)
	    compiler="pdflatex"
	    ;;
	-t|--tex)
	    compiler="pdftex"
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

mkdir -p "./$output_dir" ## Defaults to .temp
## Build tex_source into output_dir
eval "$compiler -output-directory ./$output_dir $tex_source"
## Move the output PDF out of output_dir into current directory
pdf_output="${tex_source%\.tex}.pdf"
mv "./$output_dir/$pdf_output" .
