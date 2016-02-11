# ambil title, ganti plus dgn spasi, ubah lower case ke title case
echo title | sed -e 's/+/ /g' -e 's/.*/\L&/; s/[a-z]*/\u&/g' > deletejudul1.txt
cat deletejudul1.txt >> delete.csv
# ambil judul strip
echo title | sed 's/+/-/g' > deletejudulstrip.txt
# total gambar
wc -l < file/title.txt > deletetotal1.txt
# ambil gambar 1
sed -n 1p file/title.txt > deletegambar1.txt
# ambil link gambar 1 
cat deletegambar1.txt | sed -e 's/.jpg//g' > deletegambar2.txt
# ambil judul gambar 1
cat deletegambar1.txt | sed -e 's/.jpg//g' -e 's/-/ /g' -e 's/.*/\L&/; s/[a-z]*/\u&/g' > deletejudulgambar.txt
# buat gambar1.html
echo "cat a.html | sed -e 's/judulstrip/$(cat deletejudulstrip.txt)/g' -e 's/gambar1/$(cat deletegambar1.txt)/g' -e 's/gambar2/$(cat deletegambar2.txt)/g' -e 's/judulgambar/$(cat deletejudulgambar.txt)/g' -e 's/judul1/$(cat deletejudul1.txt)/g' > deletegambar1.html" | bash -
# ambil list gambar untuk galery
cat file/title.txt | sed "1d" | awk 'FNR==0{print ""}{print}' | while read line; do
    echo "$line" | sed -e 's/.jpg//g' > deletegambar2.txt
    echo "echo '$line' | sed -e 's/.jpg//g' -e 's/-/ /g' -e 's/.*/\L&/; s/[a-z]*/\u&/g' > deletejudulgambar.txt" | bash -
    echo "cat b.html | sed -e 's/judulstrip/$(cat deletejudulstrip.txt)/g' -e 's/gambar2/$(cat deletegambar2.txt)/g' -e 's/judulgambar/$(cat deletejudulgambar.txt)/g' -e 's/judul1/$(cat deletejudul1.txt)/g' >> deletegallery.html" | bash -
done
# tambah clear di line 5
sed -e "5 a <p style='clear: both' />" -e "10 a <p style='clear: both' />" -e "15 a <p style='clear: both' />" -e "20 a <p style='clear: both' />" -e "$ a <p style='clear: both' />" deletegallery.html > deletegallery2.html
# tambah awalan dan akhiran serta ganti new line dengan br
echo "awk 'FNR==1{print \"<div id='gallery-1'><center><h2>Picture gallery of $(cat deletejudul1.txt)</h2></center>\"}{print}' deletegallery2.html | sed '$ a </div>' | tr '\n' ' ' > deletegallery.html" | bash -
# spin article
echo "cat spin/par1/$(shuf -i 1-5 -n 1)" > deletepar.txt
  echo "$(cat deletepar.txt)/1 | shuf -n 1 >> deletepar1a.txt" | bash -
  echo "$(cat deletepar.txt)/2 | shuf -n 1 >> deletepar1a.txt" | bash -
  echo "$(cat deletepar.txt)/3 | shuf -n 1 >> deletepar1a.txt" | bash -
  echo "$(cat deletepar.txt)/4 | shuf -n 1 >> deletepar1a.txt" | bash -  
  echo "$(cat deletepar.txt)/5 | shuf -n 1 >> deletepar1a.txt" | bash -  
echo "cat spin/par2/$(shuf -i 1-5 -n 1)" > deletepar.txt
  echo "$(cat deletepar.txt)/1 | shuf -n 1 >> deletepar2a.txt" | bash -
  echo "$(cat deletepar.txt)/2 | shuf -n 1 >> deletepar2a.txt" | bash -
  echo "$(cat deletepar.txt)/3 | shuf -n 1 >> deletepar2a.txt" | bash -
  echo "$(cat deletepar.txt)/4 | shuf -n 1 >> deletepar2a.txt" | bash -  
  echo "$(cat deletepar.txt)/5 | shuf -n 1 >> deletepar2a.txt" | bash -  
echo "cat spin/par3/$(shuf -i 1-5 -n 1)" > deletepar.txt
  echo "$(cat deletepar.txt)/1 | shuf -n 1 >> deletepar3a.txt" | bash -
  echo "$(cat deletepar.txt)/2 | shuf -n 1 >> deletepar3a.txt" | bash -
  echo "$(cat deletepar.txt)/3 | shuf -n 1 >> deletepar3a.txt" | bash -
  echo "$(cat deletepar.txt)/4 | shuf -n 1 >> deletepar3a.txt" | bash -  
  echo "$(cat deletepar.txt)/5 | shuf -n 1 >> deletepar3a.txt" | bash -  
echo "cat spin/par4/$(shuf -i 1-5 -n 1)" > deletepar.txt
  echo "$(cat deletepar.txt)/1 | shuf -n 1 >> deletepar4a.txt" | bash -
  echo "$(cat deletepar.txt)/2 | shuf -n 1 >> deletepar4a.txt" | bash -
  echo "$(cat deletepar.txt)/3 | shuf -n 1 >> deletepar4a.txt" | bash -
  echo "$(cat deletepar.txt)/4 | shuf -n 1 >> deletepar4a.txt" | bash -  
  echo "$(cat deletepar.txt)/5 | shuf -n 1 >> deletepar4a.txt" | bash -  
echo "cat spin/par5/$(shuf -i 1-5 -n 1)" > deletepar.txt
  echo "$(cat deletepar.txt)/1 | shuf -n 1 >> deletepar5a.txt" | bash -
  echo "$(cat deletepar.txt)/2 | shuf -n 1 >> deletepar5a.txt" | bash -
  echo "$(cat deletepar.txt)/3 | shuf -n 1 >> deletepar5a.txt" | bash -
  echo "$(cat deletepar.txt)/4 | shuf -n 1 >> deletepar5a.txt" | bash -  
  echo "$(cat deletepar.txt)/5 | shuf -n 1 >> deletepar5a.txt" | bash -  
cat deletepar1a.txt | awk 1 ORS=' ' | sed -e 's/^/<div style="text-align: justify">/' -e 's/$/\<\/div\>/' > deletepar1.txt
cat deletepar2a.txt | awk 1 ORS=' ' | sed -e 's/^/<div style="text-align: justify">/' -e 's/$/\<\/div\>/' > deletepar2.txt
cat deletepar3a.txt | awk 1 ORS=' ' | sed -e 's/^/<div style="text-align: justify">/' -e 's/$/\<\/div\>/' > deletepar3.txt
cat deletepar4a.txt | awk 1 ORS=' ' | sed -e 's/^/<div style="text-align: justify">/' -e 's/$/\<\/div\>/' > deletepar4.txt
cat deletepar5a.txt | awk 1 ORS=' ' | sed -e 's/^/<div style="text-align: justify">/' -e 's/$/\<\/div\>/' > deletepar5.txt
#upload youtube
wget  -qO- --header="Accept: text/html" --user-agent="Googlebot-Image/1.0" "http://www.bing.com/videos/search?scope=video&pq=title&sc=1-30&sp=-1&sk=&q=title&qft=+filterui:msite-youtube.com" | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | grep 'watch?v' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' -e 's/https:\/\/www.youtube.com\/watch?v=//g' | shuf -n 1 > deleteyoutube.txt
echo "<br/><style>.embed-container { position: relative; text-align: center; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe type=\"text/html\" width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/$(cat deleteyoutube.txt)?autohide=1&rel=0&controls=0&modestbranding=1&disablekb=1&theme=light&enablejsapi=1\" frameborder=\"0\"></iframe></div>" >> deletepar5.txt
# shuffle templates
echo "cat template/$(shuf -i 1-6 -n 1)" | bash - | bash -
# shuffle category
echo "$(shuf -n 1 data/category.txt)" > deletecategory1.txt
# scrape tags from ask.com
cat ask.py | sed 's/deleteask/title/g' > delete.py
python delete.py > deletekeyword.txt
sed -i 's/&amp/and/g' deletekeyword.txt
sed -i 's/&/and/g' deletekeyword.txt
sed -i 's/ä/a/g' deletekeyword.txt
sed -i 's/ö/o/g' deletekeyword.txt
sed -i 's/ü/u/g' deletekeyword.txt
tr -d '[:punct:]' < deletekeyword.txt > deletekeyword1.txt 
tr -cd '\11\12\40-\176' < deletekeyword1.txt > deletekeyword.txt
awk --re-interval 'length > 1' < deletekeyword.txt > deletekeyword1.txt
awk 1 ORS=', ' < deletekeyword1.txt > deletekeyword.txt
sed -i 's/  / /g' deletekeyword.txt
sed -e 's/,,/,/g' -e 's/, ,/,/g' -e 's/,,/,/g' -e 's/ , /, /g' deletekeyword.txt | sed 's/.$//' | sed 's/.$//' > deletetags1.txt
# shuffle author
echo "$(shuf -n 1 data/author.txt)" > deleteauthor1.txt
# input description
echo "sed -e 's/judul1/$(cat deletejudul1.txt)/g' -e 's/total1/$(cat deletetotal1.txt)/g' -e 's/category1/$(cat deletecategory1.txt)/g' -e 's/author1/$(cat deleteauthor1.txt)/g' -e 's/tags1/$(cat deletetags1.txt)/g' deletedes.txt | awk 1 ORS='<br/>' | sed 's/|/;/g' >> delete.csv" | bash -
# input category
echo "|$(cat deletecategory1.txt)" >> delete.csv
# input tags
echo "$(cat deletetags1.txt)" >> delete.csv
# input author
echo "$(cat deleteauthor1.txt)" >> delete.csv
# shuffle id number
echo $(($RANDOM % 10000)) >> delete.csv
# ganti new line dengan ;
echo $(awk 'NR > 1{print line"|"}{line=$0;}END{print $0""}' delete.csv) >> /home/www/domain/wp-content/uploads/wpallimport/files/wordpress.csv
# delete & clear history
find . -maxdepth 1 -type f -name "delete*" -delete
history -c
