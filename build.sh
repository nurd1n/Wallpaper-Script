# ambil title, ganti plus dgn spasi, ubah lower case ke title case
echo title1 | sed -e 's/+/ /g' -e 's/.*/\L&/; s/[a-z]*/\u&/g' > deletejudul1.txt
# ambil judul 1 strip
echo title1 | sed 's/+/-/g' > deletejudul1strip.txt
# ambil judul 2
echo title2 | sed -e 's/-/ /g' -e 's/.jpg//g' -e 's/.*/\L&/; s/[a-z]*/\u&/g' > deletejudul2.txt
# ambil judul 2 strip
echo title2 | sed -e 's/.jpg//g' > deletejudul2strip.txt
# ambil judul image lain dalam folder yang sama
find ./done/title1/*.jpg -type f | sed 's|./done/title1/title2||g' | sed 's|./done/title1/||g' | sed '/^$/d' > deletejudul3.txt
# ambil judul 3 strip
cat deletejudul3.txt | sed -e 's/.jpg//g' > deletejudul3strip.txt
# shuffle judul 3 strip
cat deletejudul3strip.txt | shuf -n 1 > deletejudul3shuffle.txt
# total gambar
cat deletejudul3strip.txt | sed '/^$/d' |  wc -l > deletetotal1.txt
# buat gambar1.html
echo "cat a.html | sed -e 's/judulstrip1/$(cat deletejudul1strip.txt)/g' -e 's/judul3shuffle/$(cat deletejudul3shuffle.txt)/g' -e 's/judulstrip2jpg/title2/g' -e 's/judulgambar/$(cat deletejudul2.txt)/g' -e 's/judul1/$(cat deletejudul1.txt)/g' > deletegambar1.html" | bash -
# ambil list gambar untuk galery
cat deletejudul3.txt | awk 'FNR==0{print ""}{print}' | while read line; do
    echo "$line" | sed -e 's/.jpg//g' > deletegambar2.txt
    echo "echo '$line' | sed -e 's/.jpg//g' -e 's/-/ /g' -e 's/.*/\L&/; s/[a-z]*/\u&/g' > deletejudulgambar.txt" | bash -
    echo "cat b.html | sed -e 's/judulstrip1/$(cat deletejudul1strip.txt)/g' -e 's/gambar2/$(cat deletegambar2.txt)/g' -e 's/judulgambar/$(cat deletejudulgambar.txt)/g' -e 's/judul1/$(cat deletejudul1.txt)/g' >> deletegallery.html" | bash -
done
# tambah clear di line 5
sed -e "5 a <p style='clear: both' />" -e "10 a <p style='clear: both' />" -e "15 a <p style='clear: both' />" -e "20 a <p style='clear: both' />" -e "$ a <p style='clear: both' />" deletegallery.html > deletegallery2.html
# tambah awalan dan akhiran serta ganti new line dengan br
awk 'FNR==1{print "<div id='gallery-1'>"}{print}' deletegallery2.html | sed '$ a </div>' | tr '\n' ' ' > deletegallery.html
# spin article
echo "cat spin/par1/1 | shuf -n 1" | bash - > deletepar1a.txt
echo "cat spin/par1/2 | shuf -n 1" | bash - >> deletepar1a.txt
echo "cat spin/par1/3 | shuf -n 1" | bash - >> deletepar1a.txt
echo "cat spin/par1/4 | shuf -n 1" | bash - >> deletepar1a.txt
echo "cat spin/par1/5 | shuf -n 1" | bash - >> deletepar1a.txt
cat deletepar1a.txt | awk 1 ORS=' ' | sed -e 's/^/<div style="text-align: justify">/' -e 's/$/\<\/div\>/' > deletepar1.txt
echo "cat spin/par2/1 | shuf -n 1" | bash - > deletepar2a.txt
echo "cat spin/par2/2 | shuf -n 1" | bash - >> deletepar2a.txt
echo "cat spin/par2/3 | shuf -n 1" | bash - >> deletepar2a.txt
cat deletepar2a.txt | awk 1 ORS=' ' | sed -e 's/^/<div style="text-align: justify">/' -e 's/$/\<\/div\>/' > deletepar2.txt
echo "cat spin/par3/1 | shuf -n 1" | bash - > deletepar3a.txt
echo "cat spin/par3/2 | shuf -n 1" | bash - >> deletepar3a.txt
cat deletepar3a.txt | awk 1 ORS=' ' | sed -e 's/^/<div style="text-align: justify">/' -e 's/$/\<\/div\>/' > deletepar3.txt
# shuffle templates
echo "cat template/$(shuf -i 1-3 -n 1)" | bash - | bash -
# title ask
cat deletejudul2.txt | sed 's/ /\n/g' | sed -n 1,5p | awk 1 ORS='+' | sed 's/.$//' > deletejudulask.txt
# scrape tags from ask.com
echo "cat ask.py | sed 's/deleteask/$(cat deletejudulask.txt)/g' > deleteask.py" | bash -
python deleteask.py > deletekeyword.txt
sed -i 's/&amp/and/g' deletekeyword.txt
sed -i 's/&/and/g' deletekeyword.txt
sed -i 's/ä/a/g' deletekeyword.txt
sed -i 's/ö/o/g' deletekeyword.txt
sed -i 's/ü/u/g' deletekeyword.txt
tr -d '[:punct:]' < deletekeyword.txt > deletekeyword1.txt 
tr -cd '\11\12\40-\176' < deletekeyword1.txt > deletekeyword.txt
awk --re-interval 'length > 1' < deletekeyword.txt > deletekeyword1.txt
sed -i '/^$/d' deletekeyword1.txt
sed -n 1p deletekeyword1.txt | sed 's|.*|\\<a href=\\"http:\\/\\/www\\.domain\\.com\\/image\\/title2\\" target=\\"_blank\\" \\>&\\<\\/a\\>|' > deletekeyword.txt
sed -n '1!p' deletekeyword1.txt | sed '/^$/d' >> deletekeyword.txt
awk 1 ORS=', ' < deletekeyword.txt > deletekeyword2.txt
sed -i 's/  / /g' deletekeyword2.txt
sed -e 's/,,/,/g' -e 's/, ,/,/g' -e 's/,,/,/g' -e 's/ , /, /g' deletekeyword2.txt | sed 's/.$//' | sed 's/.$//' > deletetags1.txt
# kelola judul image lain
sed -n 1p deletejudul3strip.txt | sed 's/-/ /g' > deletejudul31.txt
echo "cat deletejudul31.txt | sed 's|.*|\\\<a href=\\\"http:\\\/\\\/www\\\.domain\\\.com\\\/$(cat deletejudul1strip.txt)\\\/$(sed -n 1p deletejudul3strip.txt)\\\" target=\\\"_blank\\\"\\>&\\\<\\\/a\\\>|' > deletejudul32.txt" | bash -
sed -n '1!p' deletejudul3strip.txt | sed '/^$/d' | sed 's/-/ /g' >> deletejudul32.txt
awk 1 ORS=', ' < deletejudul32.txt > deletejudul31.txt
sed -i 's/  / /g' deletejudul31.txt
sed -e 's/,,/,/g' -e 's/, ,/,/g' -e 's/,,/,/g' -e 's/ , /, /g' deletejudul31.txt | sed 's/.$//' | sed 's/.$//' > deletejudul32.txt
# ambil width and height
exiftool -s3 -ImageWidth done/title1/title2 > deletepanjang1.txt
exiftool -s3 -ImageHeight done/title1/title2 > deletelebar1.txt
# shuffle author
echo "$(shuf -n 1 data/author.txt)" | sed 's/.*/\L&/; s/[a-z]*/\u&/g' > deleteauthor1.txt
cat deleteauthor1.txt | sed -e 's/Leeedwardjoon/1/g' -e 's/Milley/2/g' -e 's/Martha/3/g' -e 's/Edward/4/g' -e 's/Samuel/5/g' -e 's/Daniel/6/g' -e 's/Cason/7/g' -e 's/Vandiver/8/g' -e 's/Teresa/9/g' -e 's/Collins/10/g' -e 's/Carole/11/g' -e 's/Tomlin/12/g' -e 's/Sharoon/13/g' -e 's/Issac/14/g' -e 's/Samantha/15/g' -e 's/Turner/16/g' > deleteauthor2.txt
# shuffle tanggal dan waktu
echo "$(shuf -i 2012-2015 -n 1)-$(shuf -i 1-12 -n 1 | sed 's/.*/0&/' | tail -c 3)-$(shuf -i 1-28 -n 1 | sed 's/.*/0&/' | tail -c 3)" > deletetanggal.txt
echo "$(shuf -i 1-23 -n 1 | sed 's/.*/0&/' | tail -c 3):$(shuf -i 1-59 -n 1 | sed 's/.*/0&/' | tail -c 3):$(shuf -i 1-59 -n 1 | sed 's/.*/0&/' | tail -c 3)" > deletewaktu.txt
# tanggalwaktu
echo "shuf -n 1 spin/tanggal | sed -e 's/tanggal/$(cat deletetanggal.txt)/g' -e 's/waktu/$(cat deletewaktu.txt)/g'" | bash - | bash - > deletetanggalwaktu.txt
# exiftool
cat deletekeyword1.txt | sed '/^$/d' > deletekeyword.txt
awk 1 ORS=', ' < deletekeyword.txt > deletekeyword1.txt
sed -i 's/  / /g' deletekeyword1.txt
sed -e 's/,,/,/g' -e 's/, ,/,/g' -e 's/,,/,/g' -e 's/ , /, /g' deletekeyword1.txt | sed 's/.$//' | sed 's/.$//' > deletetags2.txt
echo "exiftool -Title=\"$(cat deletejudul2.txt) - $(cat deletejudul1.txt)\" -Author=\"$(cat deleteauthor1.txt)\" -Description=\"The picture/image of $(cat deletejudul2.txt) - $(cat deletejudul1.txt)\" -Keyword=\"$(cat deletejudul2.txt), $(cat deletejudul1.txt), $(cat deletetags2.txt)\" -Copyright=\"Source http://www.domain.com/image/title2\" done/title1/title2" | bash -
# sitemap
echo "cat data/sitemap | sed -e 's|judul1|$(< \deletejudul1strip.txt)|g' -e 's|judul2|$(< \deletejudul2strip.txt)|g' -e 's|tanggal|$(< \deletetanggal.txt)|g' -e 's|waktu|$(< \deletewaktu.txt)|g' >> Report/sitemap-attachment.xml" | bash -
# sql file 1
echo "cat data/sql1 | sed -e 's|author2|$(cat deleteauthor2.txt)|g' -e 's|tanggal|$(cat deletetanggal.txt)|g' -e 's|waktu|$(cat deletewaktu.txt)|g' >> deletesql.txt" | bash -
# input description
sed -i "s/'/''/g" deletedes.txt
echo "cat deletedes.txt | awk 1 ORS='<br/>' | sed -e 's|judul1|$(cat deletejudul1.txt)|g' -e 's|judulstrip1|$(< \deletejudul1strip.txt)|g' -e 's|judul2|$(cat deletejudul2.txt)|g' -e 's|author1|$(cat deleteauthor1.txt)|g' -e 's|tanggalwaktu|$(cat deletetanggalwaktu.txt)|g' -e 's|panjang1|$(cat deletepanjang1.txt)|g' -e 's|lebar1|$(cat deletelebar1.txt)|g' -e 's|total1|$(cat deletetotal1.txt)|g' -e 's|judul3|$(cat deletejudul32.txt)|g' -e 's|tags1|$(cat deletetags1.txt)|g' >> deletesql.txt" | bash -
# sql file 2
echo "cat data/sql2 | sed -e 's|judul2|$(cat deletejudul2.txt)|g' >> deletesql.txt" | bash -
# mysql
echo "$(cat deletesql.txt)" | awk 1 ORS='' | sed '$a\' > deletemysql.sql
# upload image
cd /home/domain/wordpress
echo "wp media import /home/wallpaper/attachment/done/title1/title2 --post_id=$(cat /home/wallpaper/attachment/id/title1) --porcelain --allow-root > /home/wallpaper/attachment/deleteid.txt" | bash -
# generate thumbnail
echo "wp media regenerate $(cat /home/wallpaper/attachment/deleteid.txt) --yes --allow-root" | bash -
# mysql
wp db query --allow-root < /home/wallpaper/attachment/deletemysql.sql
# delete & clear history
cd /home/wallpaper/attachment
find . -maxdepth 1 -type f -name "delete*" -delete
history -c
clear
