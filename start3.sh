IFS=';'
while read f1 f2; do
    echo "sed -e 's|urlbing|$f1|g' -e 's|asin|$f2|g' build.sh > build2.sh" | bash -
    echo "chmod 755 build2.sh" | bash -
    echo "./build2.sh" | bash -
    echo "rm -f build2.sh" | bash -
done < url
