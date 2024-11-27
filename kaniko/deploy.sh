kubectl delete job kaniko-build-job-sonic
kubectl delete secret docker-config -n cms
kubectl create secret generic docker-config --from-file=config.json=$HOME/.docker/config-geddes.json -n cms
kubectl apply -n cms -f kaniko/build-job.yaml