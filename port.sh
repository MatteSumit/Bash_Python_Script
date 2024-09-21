#!/bin/bash

echo "Enter Port No."
read port

# Use nc to attempt to connect to the port on localhost (127.0.0.1)
nc -z -v 127.0.0.1 "$port"

# Check the exit status of nc
if [ $? -eq 0 ]; then
    echo "Port $port is open."
else
    echo "Port $port is closed."
fi

