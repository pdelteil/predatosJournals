 #!/usr/bin/parallel --shebang-wrap /bin/bash

#echo Arguments "$@"
#input=$1

#while IFS= read -r line
#    do
#    echo "http://waset.org$line"
curl -s "http://waset.org$@"| grep -v profile| grep conference|pup 'a attr{href}'|awk '{print "http://waset.org"$0}'
#done < "$input"
