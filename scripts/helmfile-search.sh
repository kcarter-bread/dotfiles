echo "Which helm deploy do you want to search for?"

read varname

echo "logs will output to current working directory: $PWD/$varname.txt"

echo "Removing previous run of helmfile-search logfile output ${varname}.txt"

if test -f "$varname.txt"; then 
    rm ${varname}.txt
fi

sleep 5

touch ${varname}.txt

clusters=($(kubectl config get-contexts -o=name | sed 's/[^\/]*\///'))

for c in ${clusters[@]}; 
do 
    kubectx $c 
    #echo $c >> $varname.txt
	if [[ $(helm list -A | grep ${varname}) ]]; then 
	#if [[ $(helm list -A | grep ${varname}) == *$varname* ]]; then 
    echo "$c has ${varname} installed">> ${varname}.txt
    fi
	#echo "$c has ${varname} installed"
	#echo  >> reloader.txt
done 
