#!/bin/sh

SERIAL_PORT="/dev/ttymxc0"

# Configure serial port
stty -F $SERIAL_PORT 115200 raw -echo -echoe -echok

# Read data from the serial port
while true; do
    data=$(dd if=$SERIAL_PORT bs=4 count=1 2>/dev/null)
    if [ -n "$data" ]; then
        echo "Received data: $data"
    fi
done
