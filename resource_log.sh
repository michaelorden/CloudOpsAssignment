#!/bin/bash
/usr/bin/docker stats --format='{{json .}}' --no-stream > /root/log
/usr/bin/docker cp /root/log da07c746cb2d:/usr/share/nginx/html/log.html
