for a in $(find ./* -type d ! -name 'image' ! -name 'video' ! -name 'video2' | cut -c 3-); do echo "mv $a \\\$(echo $a | sed 's/.*/\$(printf "2016+new\\\\\n2016+best\\\\\n2016+top\\\\\n2016+new+best\\\\\n2016+new+top\\\\\n2016+best+new\\\\\n2016+top+new\\\\\n2016+amazing\\\\\n2016+wonderful\\\\\n2016+top+best\\\\\n2016+best+top" | shuf -n 1)+&" | sed 's/.*/echo \\\"&\\\"/' | sed 's/.*/echo "&"/' | bash - | bash - | bash - ;done
find ./* -type d ! -name 'image' ! -name 'video' ! -name 'video2' | cut -c 3- > asin.txt
