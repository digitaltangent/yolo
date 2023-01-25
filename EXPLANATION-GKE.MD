# Kubernetes Objects
I created 7 different kind of objects each with a different purpose:
1) Backend Service - This enables the backend container to intereact with the other containers by mapping the port and making it available as a Cluster IP so that internally it can connect to the other parts of the app
2) Backend Deployment - this is the container for the backend image. It defines where to pull the image from and also sets the environment variable for the backend to be able to connect to the mongo database
3) Client Service - This enables the client container to intereact with the other containers by mapping the port and making it available as a Cluster IP so that internally it can connect to the other parts of the app
4) Client Deployment - this is the container for the client image. It defines where to pull the image from for the client
5) Client Service for Load Balancer - this exposes the IP and port for the client service to an external environment so that the frontened of the eCommerce application can be accessed through a web browser
6) MongoDB Service - This enables the mongodb container to interact with the other containers by mapping the port and making it available as a Cluster IP so that internally it can connect to other parts of the app
7) MongoDB StatefulSet - In my mongodb container, I used a StatefulSet object so that we could take advantage of peristent storage. StatefulSets automatically create and manage Persistent Volume Claims (PVCs) that provide persistent storage for the data in the mongodb container. With a StatefulSet, the data stored in MongoDB will persist even if the pod or node running MongoDB fails. It also helps with scaling becuase we can increase or decrease the number of pods in the StatefulSet and Kubernetes will automatically create or delete pods as needed.

# Exposing Pods to internet traffic
In order to be able to access my pods from an external IP, I used a Service in my Kubernetes configuration YAML to create a LoadBalancer. The LoadBalancer will manage the routing of traffic internally between all the pods. Since pods can be created and destroyed many times, they will always have a changing IP address so accessing them directly is not reliable. Instead, the Load Balance creates a 'static' IP that can be used in a web browser for users to be able to access the application in the container. 

# Persistent Storage
Because we used a StatefulSet in the mongodb container, our data will not be deleted when the pods fail or are destroyed. A StatefulSet provides persistent storage by automatically creating and managing Persistent Volume Claims (PVCs) for the pods that it manages. When you create a StatefulSet, it creates a PVC for each replica of the pod that it manages. These PVCs are automatically bound to Persistent Volumes (PVs) that provide storage for the pod's data. When a pod is deleted or rescheduled, the StatefulSet ensures that the pod's PVC and PV are not deleted, this way the data remains intact and can be mounted to a new pod.

# Attempts to debug
Due to using the MAC Arm processor, my images were not quite working in the cloud as they were on my machine. To fix this, I researched different solutions and eventually added a line to my Dockerfile to specify the platform that the image should run on. I also had quite a few issues with the connection to mongo in the cloud. I used the kubectl logs <podname> to help me identify where things were going on and based on this I was able to sort out a few issues including the env variable for the connection string to the database
