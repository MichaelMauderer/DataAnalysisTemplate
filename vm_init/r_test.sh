#!/bin/bash
## deptest, in bash
R="/usr/bin/R"
name="deptest"
dsc="${name}/DESCRIPTION"
man="${name}/man/fu.Rd"
cd /tmp

# make simple package
cat << EOF > infile.tmp
fu <-  function(){"This pkg has NO dependencies"}
package.skeleton("${name}",force=T)
quit()
EOF

${R} --vanilla < infile.tmp
rm "${name}/Read-and-delete-me"
rm "${name}/man/${name}-package.Rd"

cat << EOF > ${dsc}
Package: ${name}
Type: Package
Title: It tests.
Version: 1.0
Date: 2014-07-12
Author: John Doe
Maintainer: John Doe <jdoe@doe.net>
Description: Checking --as-cran check.
License: GPL (>= 2)
EOF

cat << EOF > ${man}
\name{fu}
\alias{fu}
\title{Prints}
\description{Prints}
\usage{fu()}
\examples{fu()}
EOF

# add fresh new line et the end of .Rprofile
echo "options(repos = c(CRAN='http://cran.r-project.org'))" >> ~/.Rprofile
# check and see results
${R} CMD check --as-cran ${name}