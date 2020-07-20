#obtiene todos los topics de todas las conferencias de un año. 
years=("2014" "2015" "2016" "2017" "2018" "2019" "2020" "2021" "2022")
for val in ${years[@]}; do
   echo "doing " $val
   curl -s https://waset.org/conferences/$val| tr '<\a>' '\n' | grep href|grep topic|awk -F'=' '{print $2}' >> outputTest.txt
done

#echo $CONFS
#
# obtiene el detalle de un topic
#
#curl -s http://waset.org/topic/Social-and-Business-Sciences/2022/01/Tokyo| grep conference|pup 'a attr{href}'|awk '{print "http://waset.org"$0}'

#obtiene los papers de un topic de una conferencia
#curl -s http://waset.org/conference/2022/01/Tokyo/ICEM |pup 'div.selectedPapers a json{}'|jq '.[].href'

#obtiene abstract de un paper en un topic de una conferencia 

#curl -s http://waset.org/Publications/reverse-impact-of-temperature-as-climate-factor-on-milk-production-in-chaharmahal-and-bakhtiari-/10010037|pup 'div.abstract text{}'
