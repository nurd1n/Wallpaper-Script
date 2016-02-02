#!/bin/bash
echo "deletekeyword" | sed -e 's/ /+/g' > deletek.txt
echo "sed -e 's/keyword/$(< \deletek.txt)/g' url.sh > deleteurl.txt" | bash
cat deleteurl.txt | bash -
echo "wc -l < report/$(< \deletek.txt).txt > deleteresult.txt" | bash -
cat deleteresult.txt | awk '$0="deletekeyword,"$0' >> result.txt
sleep 1
# delete & clear history
find . -maxdepth 1 -type f -name "delete*" -delete
history -c
