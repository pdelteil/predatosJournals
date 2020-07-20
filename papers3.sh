 #!/usr/bin/parallel --shebang-wrap /bin/bash
#echo Arguments "$@"
URL="$@"
#echo $URL
RES=$(curl -s $URL |pup 'div.selectedPapers a json{}'|jq '.[].href')
#echo $RES
RES=$(echo $RES|sed 's/"//g' | sed 's/^/"/' |sed 's/$/"/')

IFS=' ' read -r -a array <<< $RES

for element in "${array[@]}"
do
    PAPER="http://waset.org$element"
    #echo $PAPER
    #ABSTRACT=$(curl $PAPER|pup 'div.abstract text{}')
    #echo $ABSTRACT
    echo $URL", " $PAPER

done
