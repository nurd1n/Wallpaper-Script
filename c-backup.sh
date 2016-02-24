for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),3840,-1)':'if(gt(a,16/9),-1,2160)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),5120,-1)':'if(gt(a,16/9),-1,2880)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
for f in asir/*.jpg; do ffmpeg -i "${f}" -vf "crop=iw/1.02:ih/1.02,scale='if(gt(a,16/9),5760,-1)':'if(gt(a,16/9),-1,3240)',colorbalance=bh=.1,setdar=st1:st2,hflip" image/"${f}"; done
