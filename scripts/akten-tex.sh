#!/bin/bash

usage () {
    echo "\

        akten-tex [options] [<.tex file>]

pdflatex        Compile to PDF as LaTeX source (default)
dvilatex        Compile to DVI as LaTeX source
t, pdftex       Compile to PDF as TeX source
dvitex          Compile to DVI as TeX source
q, quiet        Suppress echo
o=, output=     Set output directory (defaults to .temp)       

"
}
