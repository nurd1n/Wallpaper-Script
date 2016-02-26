for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),912,-1)':'if(gt(a,16/9),-1,513)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),1008,-1)':'if(gt(a,16/9),-1,567)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),1104,-1)':'if(gt(a,16/9),-1,621)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
