#delete empty folder
find ./image/* -type d -empty -exec rmdir {} \;
#folder, untuk judul artikel
find ./image/* -type d | cut -c 9- > /home/wallpaper/artikel/data/folder.txt
./isifolder.sh
#total isi untuk attachment
find ./image/*/* -type f | cut -c 9- > home/wallpaper/attachment/data/folder.txt
#pindah folder gambar ke folder don di attachment
mv */ /home/wallpaper/attachment/done
