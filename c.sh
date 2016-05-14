for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),1296,-1)':'if(gt(a,16/9),-1,729)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),1488,-1)':'if(gt(a,16/9),-1,837)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),1680,-1)':'if(gt(a,16/9),-1,945)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
