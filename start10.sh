IFS=';'
while read f1 f2; do
    echo "sed -e 's/title1/$f1/g' -e 's/title2/$f2/g' build.sh > build2.sh" | bash -
    echo "chmod 755 build2.sh" | bash -
    echo "./build2.sh" | bash -
    echo "rm -f build2.sh" | bash -    
done < data/folder.txt
