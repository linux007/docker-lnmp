#!/bin/bash

if [ "$SERVER_START" = 'true' ]; then
  /usr/local/nginx/sbin/nginx -g "daemon off;" 
else
   true
fi
