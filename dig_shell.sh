#!/bin/bash


file_path="/home/kali/Downloads/<istediğiniz liste>"
output_file="/home/kali/Downloads/<çalışan sitelerin olduğu liste>"


while IFS= read -r domain; do
  result=$(dig $domain | grep "NOERROR")
  if [ -n "$result" ]; then
    echo "Calisiyor: $domain"
    echo "$domain" > $output_file
  else
    echo "Calismiyor: $domain"
  fi
done < "$file_path"
