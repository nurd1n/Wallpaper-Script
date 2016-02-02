for f in *.txt; do cat "${f}" | awk '{print $0";'${f%%.txt}'"}' >> /home/image/url; done
find . -maxdepth 1 -type f -name "*.txt" -delete
history -c
