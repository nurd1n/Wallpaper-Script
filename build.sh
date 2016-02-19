mkdir done/asin
if [ $(find done/asin -type f | wc -l) -lt "20" ]; then
  for f in done/asin/*.jpg; do 
  if [ $(exiftool -s3 -ImageWidth "$f") -z "$VAR" ]; then
  rm -f "$f"
  else
  clear
  fi
  done
  cat bingtitle.py > deletetitle.py
  cat bingimage.py > deleteimage.py
  sed -i 's|bingurlan|urlbing|g' delete*
  ./a.sh
  python deleteimage.py > deleteimage.txt
if [ $(grep $(cat deleteimage.txt) < urlimage.txt | wc -l) -gt "0" ]; then
clear
else
  #Scrape title
  python deletetitle.py > deletetitle.txt
  awk --re-interval 'length > 1' < deletetitle.txt > deletetitle1.txt
  sed -n '1p' < deletetitle1.txt > deletetitle.txt
  echo "echo \$(cat deletetitle.txt) | sed -e 's/&amp/-and-/g' -e 's/&/-and-/g' -e 's/ä/a/g' -e 's/ö/o/g' -e 's/ü/u/g' -e 's/[+_,;: (){}]/-/g' -e 's/--/-/g' -e 's/\[/-/g'  -e 's/\]/-/g' | tr -d '\041-\047' | tr -d '\052' | tr -d '\056-\057' | tr -d '\074-\100' | tr -d '\134' | tr -d '\136' | tr -d '\140' | tr -d '\174' | tr -d '\176' | sed -e 's/--/-/g' -e 's/^-*//g' -e 's/-*$//g' > deletetitle2.txt" | bash -
  #Scrape image
  echo "curl -A 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0, Googlebot-Image/1.0' -O '$(< \deleteimage.txt)' --max-time 15" | bash -
  echo $(($RANDOM % 1000)) > deletenumber.txt
  for f in *.jpg; do mv -- "$f" `echo $f | sed -e 's/&amp/-and-/g' -e 's/&/-and-/g' -e 's/ä/a/g' -e 's/ö/o/g' -e 's/ü/u/g' -e 's/[+_,;: (){}]/-/g' -e 's/--/-/g' -e 's/\[/-/g'  -e 's/\]/-/g' | tr -d '\041-\047' | tr -d '\052' | tr -d '\056-\057' | tr -d '\074-\100' | tr -d '\134' | tr -d '\136' | tr -d '\140' | tr -d '\174' | tr -d '\176' | sed -e 's/--/-/g' -e 's/jpg/.jpg/g' -e 's/^-*//g' -e 's/-.jpg//g' -e 's/.jpg/-/g' -e 's/-*$/.jpg/g'`; done
  for f in *.JPG; do mv -- "$f" `echo $f | sed -e 's/&amp/-and-/g' -e 's/&/-and-/g' -e 's/ä/a/g' -e 's/ö/o/g' -e 's/ü/u/g' -e 's/[+_,;: (){}]/-/g' -e 's/--/-/g' -e 's/\[/-/g'  -e 's/\]/-/g' | tr -d '\041-\047' | tr -d '\052' | tr -d '\056-\057' | tr -d '\074-\100' | tr -d '\134' | tr -d '\136' | tr -d '\140' | tr -d '\174' | tr -d '\176' | sed -e 's/--/-/g' -e 's/JPG/.JPG/g' -e 's/^-*//g' -e 's/-.JPG//g' -e 's/.JPG/-/g' -e 's/-*$/.JPG/g'`; done
  for f in *.png; do mv -- "$f" `echo $f | sed -e 's/&amp/-and-/g' -e 's/&/-and-/g' -e 's/ä/a/g' -e 's/ö/o/g' -e 's/ü/u/g' -e 's/[+_,;: (){}]/-/g' -e 's/--/-/g' -e 's/\[/-/g'  -e 's/\]/-/g' | tr -d '\041-\047' | tr -d '\052' | tr -d '\056-\057' | tr -d '\074-\100' | tr -d '\134' | tr -d '\136' | tr -d '\140' | tr -d '\174' | tr -d '\176' | sed -e 's/--/-/g' -e 's/png/.png/g' -e 's/^-*//g' -e 's/-.png//g'-e 's/.png/-/g' -e 's/-*$/.png/g'`; done
  for f in *.jpeg; do mv -- "$f" `echo $f | sed -e 's/&amp/-and-/g' -e 's/&/-and-/g' -e 's/ä/a/g' -e 's/ö/o/g' -e 's/ü/u/g' -e 's/[+_,;: (){}]/-/g' -e 's/--/-/g' -e 's/\[/-/g'  -e 's/\]/-/g' | tr -d '\041-\047' | tr -d '\052' | tr -d '\056-\057' | tr -d '\074-\100' | tr -d '\134' | tr -d '\136' | tr -d '\140' | tr -d '\174' | tr -d '\176' | sed -e 's/--/-/g' -e 's/jpeg/.jpeg/g' -e 's/^-*//g' -e 's/-.jpeg//g'-e 's/.jpeg/-/g' -e 's/-*$/.jpeg/g'`; done
  echo "for a in *.jpg; do mv -- \$a done/asin/$(< \deletetitle2.txt)-\${a%.jpg}-$(< \deletenumber.txt).jpg; done" | bash -
  echo "for a in *.JPG; do mv -- \$a done/asin/$(< \deletetitle2.txt)-\${a%.JPG}-$(< \deletenumber.txt).jpg; done" | bash -
  echo "for a in *.png; do mv -- \$a done/asin/$(< \deletetitle2.txt)-\${a%.png}-$(< \deletenumber.txt).jpg; done" | bash -
  echo "for a in *.jpeg; do mv -- \$a done/asin/$(< \deletetitle2.txt)-\${a%.jpeg}-$(< \deletenumber.txt).jpg; done" | bash -
  echo "for a in *.jpg; do cp -- \$a done/asin/$(< \deletetitle2.txt)-\${a%.jpg}-$(< \deletenumber.txt).jpg; done" | bash -
  echo "for a in *.JPG; do cp -- \$a done/asin/$(< \deletetitle2.txt)-\${a%.JPG}-$(< \deletenumber.txt).jpg; done" | bash -
  echo "for a in *.png; do cp -- \$a done/asin/$(< \deletetitle2.txt)-\${a%.png}-$(< \deletenumber.txt).jpg; done" | bash -
  echo "for a in *.jpeg; do cp -- \$a done/asin/$(< \deletetitle2.txt)-\${a%.jpeg}-$(< \deletenumber.txt).jpg; done" | bash -
  cd done/asin
  for f in *.jpg; do echo "mv -- $f \$(echo $f | sed 's/^-*//')" | bash -; done
  cd -
  for f in done/asin/*.jpg; do mv -- $f $(echo $f | sed -e 's/.jpg//g' -e 's/done\/asin\///g' -e 's/\./-/g' -e 's/_/-/g' -e 's/[+_,;: (){}]/-/g' -e 's/---/-/' -e 's/---/-/' -e 's/--/-/' -e 's/--/-/' -e 's/--/-/' | cut -c -180 | tr -cd '[[:alnum:]]._-' | sed 's/.*/done\/asin\/&.jpg/') ; done
  find ./done/asin/* -wholename "*.jpg" -size -15k -delete
  find ./done/asin/* -not -empty -type f -printf '%s\n' | sort -rn | uniq -d | xargs -I{} -n1 find ./done/asin/* -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate | cut -c 37- | sed -n '1!p' | xargs shred -v -n 25 -u -z
  echo "$(cat deleteimage.txt)" >> urlimage.txt
  find . -maxdepth 1 -type f ! -name "*.sh" ! -name "url" ! -name "urlimage.txt" ! -name "urlsudah" ! -name "*.py" -delete
  find . -maxdepth 1 -type f -name "delete*" -delete
  history -c
  clear
fi
 else
  clear
fi
echo "asin" >> reportdone.txt
