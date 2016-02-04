mkdir image/asin
mkdir video/asin
shuf -n 1 c.sh | sed 's/asir/asin/g' > delete.txt
for f in asin/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),1280,-1)':'if(gt(a,16/9),-1,720)',colorbalance=bh=.1,setdar=64:31,hflip"  video/"${f}"; done
cat video/asin/*.jpg | ffmpeg -f image2pipe -r 1/10 -vcodec mjpeg -i - video/asin.mp4
echo "sed -e 's/st1/$(shuf -i 20-95 -n 1)/g' -e 's/st2/$(shuf -i 20-95 -n 1)/g' delete.txt" | bash - | bash -
for f in image/asin/*.jpg; do mv -v $f `echo $f | tr '[A-Z]' '[a-z]'`; done
for f in image/asin/*.jpg; do mv -v $f `echo $f | tr '[A-Z]' '[a-z]'`; done
rm -r -f asin
rm -r -f video/asin
