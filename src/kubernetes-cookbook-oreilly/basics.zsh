# Start minikube cluster if you haven't already
minikube start
# Create a pod that will run the ghost microblogging platform
kubectl run ghost --image=ghost:5.59.4 --env="NODE_ENV=development"
# Expose the pod 
kubectl expose pod ghost --port=2368 --type=NodePort
# Run the ghost service (tunnel through to the open port)
 minikube service ghost
