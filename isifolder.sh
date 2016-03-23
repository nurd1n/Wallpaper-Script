#folder + isi folder dalam bentuk txt untuk folder file di artikel
IFS=';'
while read f1; do
    echo "find ./image/$f1/ -type f -mtime -14 -printf '%f\n' > /home/wallpaperdomainekstension/artikel/file/$f1.txt" | bash -
done < /home/wallpaperdomainekstension/artikel/data/folder.txt
