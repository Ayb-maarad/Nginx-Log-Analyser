#!/bin/bash

echo "top 5 IP with most requests:"
printf "\n\n"

awk '{print $1}' nginx-access.log | uniq -c | sort -nr | head -n 5 |

while read -r count ip; do 
        echo "requests: $count - with ip: $ip"
done 


echo "top 5 requested paths"
printf "\n\n"

awk -F '"' '{print $2}' nginx-access.log | awk '{print $2}' | sort | uniq -c | sort -nr | head -n 5 |

while read -r count path; do 

        echo "requests : $count - for path : api$path"
done
  
echo "top 5 status code :"
printf "\n\n"
awk -F '"' '{print $3}' nginx-access.log | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 5 |

while read -r count code; do 

        echo "requests : $count - for status code : $code"
done
 

