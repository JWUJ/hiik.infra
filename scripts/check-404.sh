#!/usr/bin/env sh
# this script prints current 404s from favor-group.ru for redirects troubleshooting
# google shows year-old pages and we need to redirect poor souls clicking on them somewhere

fgrep '" 404 ' logs/nginx/favor-group.ru.access.log | egrep 'YandexBot/|Googlebot/' | cut -d '"' -f 2 | cut -d ' ' -f 2 | egrep -v '^(/bitrix/cache/|/upload/)' | sort | uniq -c | less
