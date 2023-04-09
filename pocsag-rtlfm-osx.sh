#!/bin/sh
# You need Homebrew installed first. Follow instructions at:
# 
# https://brew.sh/
#
# then, install rtl-sdr:
# brew install rtl-sdr
#
# Manually compile and install multimon-ng:
# git clone https://github.com/EliasOenal/multimon-ng
# cd multimon-ng
# mkdir build
# cd build
# cmake ..
# make
# sudo make install
#
# Then this script should work. Run it in a terminal window. 
# You must know the frequency you want to monitor for pager traffic, and
# you must pass that frequency to this script. e.g. 151800000 or 151.8M 
rtl_fm -s 22050 -f $1 | \
multimon-ng -t raw -a SCOPE -a FLEX -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -f alpha -
