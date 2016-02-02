IFS=';'
while read f1; do
    echo "sed -e 's|asin|$f1|g' a.sh > deletea.sh" | bash -
    echo ./deletea.sh | bash -
    echo "shred -v -n 25 -u -z delete*" | bash -
done < asin.txt
