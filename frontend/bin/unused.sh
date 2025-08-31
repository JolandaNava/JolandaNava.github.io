#!/usr/bin/env bash
set -euo pipefail

# uses elm-xref to report on unused functions
# - redirects stderr to stdout
# - filters out all the unused functions located from lib (library drafts)
# - removes all the file patches (module names are enough to know)
# - removes all the results from auto generated modules
elm-xref 2>&1 | grep -v lib/ | cut -f2 | grep -v Generated
