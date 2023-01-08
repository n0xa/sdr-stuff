#!/bin/sh
# pocsag.sh - ax0n@h-i-r.net - IG: @4x0nn
#
# Receives audio stream from GQRX with netcat,
# re-formats the audio to prepare it for decoding
# and decodes pager messages with GQRX
netcat -l -u 127.0.0.1 -p 7355 |\
sox -t raw -esigned-integer -b16 -r 48000 - \
    -esigned-integer -b16 -r 22050 -t raw - |\
multimon-ng -t raw \
            -a FLEX \
            -a POCSAG512 \
            -a POCSAG1200 \
            -a POCSAG2400 \
            -f alpha \
            -

