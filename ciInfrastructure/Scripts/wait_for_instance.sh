#!/bin/bash

while [ ! -f /etc/hosts ]; do
  echo -e "\033[1;36mWaiting for instance-init..."
  sleep 10
done