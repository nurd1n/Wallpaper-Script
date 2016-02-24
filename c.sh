for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),720,-1)':'if(gt(a,16/9),-1,405)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),816,-1)':'if(gt(a,16/9),-1,459)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),912,-1)':'if(gt(a,16/9),-1,513)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
