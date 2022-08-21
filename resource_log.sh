#!/bin/bash
/usr/bin/docker stats --format='{{json .}}' --no-stream > /root/log
/usr/bin/docker cp /root/log 9f729129edc0:/usr/share/nginx/html/log.html
