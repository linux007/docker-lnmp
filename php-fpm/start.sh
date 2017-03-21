#!/bin/bash

if [ "$SERVER_START" = 'true' ]; then
   php-fpm 
else
   true
fi
