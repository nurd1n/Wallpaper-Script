IFS=';'
while read f1; do
    echo "sed -e 's|asin|$f1|g' b.sh > deleteb.sh" | bash -
    echo ./deleteb.sh | bash -
    echo "shred -v -n 25 -u -z delete*" | bash -
done < asin.txt
