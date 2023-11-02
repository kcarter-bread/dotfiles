#namespace="bread-services"
echo "Which Namespace has stuck terminating pods?" 

#read varname

echo "The Cleansing has begun on $varname" 

for p in $(kubectl get pods -A | grep Terminating | awk '{print $1}'); do kubectl delete pod $p  --grace-period=0 --force;done

#for p in $(kubectl get pods -n ${namespace} | grep Terminating | awk '{print $1}'); do kubectl delete pod $p -n ${namespace} --grace-period=0 --force;done
