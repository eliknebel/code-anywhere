#!/bin/bash

echo Waiting for ngrok to start...

sleep 3

public_url=$(curl 127.0.0.1:4040/api/tunnels | jq -r '.tunnels[0].public_url')
echo code-server is now available at: ${public_url}/?folder=/workspace