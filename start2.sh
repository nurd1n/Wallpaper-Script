for f in *.txt; do cat "${f}" | awk '{print $0";'${f%%.txt}'"}' >> url; done
find . -maxdepth 1 -type f -name "*.txt" -delete
history -c
