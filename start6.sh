#delete empty folder
find . -type d -empty -exec rmdir {} \;
#folder, untuk judul artikel
find . -type d | cut -c 3- > /home/wallpaper/artikel/data/folder.txt
./isifolder.sh
#total isi untuk attachment
find ./*/* -type f | cut -c 3- > home/wallpaper/attachment/data/folder.txt
#pindah folder gambar ke folder don di attachment
mv */ /home/wallpaper/attachment/done
