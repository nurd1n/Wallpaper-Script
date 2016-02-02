#!/bin/bash
while read f1; do
    echo "sed -e 's|deletekeyword|$f1|g' build.sh > build2.sh" | bash -
    echo "chmod 755 build2.sh" | bash -
    echo ./build2.sh | bash -
    echo "shred -v -n 25 -u -z build2.sh" | bash -
done < "keyword.txt"
