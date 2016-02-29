mkdir -p image/asin
shuf -n 1 c.sh | sed 's/asir/asin/g' > delete.txt
cat video2/video/asin/*.jpg | ffmpeg -f image2pipe -r 1/10 -vcodec mjpeg -i - video/asin.mp4
echo "sed -e 's/st1/$(shuf -i 20-95 -n 1)/g' -e 's/st2/$(shuf -i 20-95 -n 1)/g' delete.txt" | bash - | bash -
for f in image/asin/*.jpg; do mv -- $f $(echo $f | sed -e 's/.jpg//g' -e 's/image\/asin\///g' -e 's/\./-/g' -e 's/_/-/g' -e 's/[+_,;: (){}]/-/g' -e 's/---/-/' -e 's/---/-/' -e 's/--/-/' -e 's/--/-/' -e 's/--/-/' | cut -c -180 | tr -cd '[[:alnum:]]-' | tr '[A-Z]' '[a-z]' | sed 's/.*/image\/asin\/&.jpg/') ; done
rm -r -f asin
