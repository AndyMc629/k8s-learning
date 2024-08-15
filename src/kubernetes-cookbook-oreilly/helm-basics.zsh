# Search helm artifact hub for redis charts as an example
helm search hub --list-repo-url redis
# Deploy bitnami chart
helm repo add bitnami https://charts.bitnami.com/bitnami
# Update locally cached index of the chart repos
helm repo update
# Look for redis in bitnami chart repo
helm search repo bitnami/redis
# Get redis password (example)
export REDIS_PASSWORD=$(kubectl get secret --namespace default redis -o jsonpath="{.data.redis-password}" | base64 -d)
# See redis pods
kubectl get all -l app.kubernetes.io/name=redis
# See existing helm release objects
helm list
# check status of a helm deployment, in this case redis
helm status redis
# Show customisable parameters of a chart - note: this gives you MANY VALUES!
helm show values bitnami/redis
# View a helm charts readme - note: the readme is BIG IN THE TERMINAL!
helm show readme bitnami/redis
# Overriding a default parameter in the chart - note: you'll need to uninstall with helm uninstall redis first
helm install redis bitnami/redis --set architecture=standalone
# Read in multiple values (or one) from values.yaml file
helm install redis bitnami/redis --values values.yaml
# Get extended info about a helm release, such as user supplied values
helm get values redis
# Uninstall a helm release
helm uninstall redis