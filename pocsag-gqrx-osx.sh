#!/bin/sh
# There are many different flavors of NetCat (nc) and this
# is the syntax to get it working on MacOS (Tested with Monterey 12.5.1)
# You need Homebrew installed first. Follow instructions at:
# 
# https://brew.sh/
#
# Then install GQRX and sox:
# brew install gqrx
# brew install sox 
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
# Launch GQRX and in the [...] menu in the lower right, select "network" 
# and set it to use 127.0.0.1 port 7355 (localhost won't always work)
# And then tune in to your local pager channels in narrow FM mode.
# Once you hear pager signals, on the "Receiver Options" tab in the right
# side, click the "UDP" button to start sending audio to this script for
# processing. 
nc -l -u 127.0.0.1 7355 | \
sox -t raw -esigned-integer -b16 -r 48000 - \
-esigned-integer -b16 -r 22050 -t raw - | \
multimon-ng -t raw -a FLEX -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -f alpha -
