#!/bin/bash

# Масив із вебсайтами для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

log_file="./task1/website_status.txt"

> "$log_file"

for website in "${websites[@]}"
do
  http_status=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")
  
  if [ "$http_status" -eq 200 ]; then
    echo "$website is UP" >> "$log_file"
  else
    echo "$website is DOWN" >> "$log_file"
  fi
done

echo "Результати перевірки записано у файл $log_file"