cd /home/domain/wordpress
wp post list --post_type=post --fields=ID,post_title --format=csv --allow-root > /home/wallpaper/artikel/domain-post.csv
cd /home/wallpaper/artikel
cat domain-post.csv | sed -e 's/ID,post_title//g' -e '/^$/d' -e 's/ /+/g' -e 's/,"/ > \/home\/wallpaper\/attachment\/id\//g' -e 's/.*/echo &/' -e 's/"/.txt/g' | tr '[A-Z]' '[a-z]' > deleteid.sh
chmod 755 deleteid.sh
./deleteid.sh
find . -maxdepth 1 -type f -name "delete*" -delete
history -c
