## Choice of base image 
I used the node:alpine image for both client and backend because this is one of the smallest images of node images on docker hub that is still supported as an official image. To get this to work, I had to add --openssl-legacy-provider to the react start script in packge.json. For the mongodb image, there wasn't really a small version so I used the latest

## Dockerfile directives used in the creation and running of each container
For the dockerfile, the directives that were used were basically to copy the instructions from the git README.md. I first used the WORKDIR to switch the working directory to the one I want to use, the copy the package.json. I do this as a standalone command so that we can make use of caching. I then use the RUN directive to install dependencies (and use the --no-install-recommends flag to keep package size lower). Finally, we copy the files in the client (or backend) from the image to the container in the same path and use the CMD directive to start the application. I used 2 Dockerfiles (one in each directory of client and backend) because this also keeps the image size lower. I also used a .dockerignore file to avoid copying the node_modules

## Docker-compose Networking (Application port allocation and a bridge network implementation) where necessary.
I used a docker network because we have to run the different parts of the application (client, server, database) in one container and we want each part to be able to communicate with the others. In my docker-compose.yml I used the yaml structure to add the key-value pairs for networks and ports in each service. I also used the network mongo-yolo-network to create the bridge network for the container

## Docker-compose volume definition and usage (where necessary).
The volume in the docker compose is used so that we can persist data. I added a volume named 'data' where any products that are created in my app can be stored and be persistent. 

## Git workflow used to achieve the task.
My git workflow was to create successive branches as I added my dockerfiles and my dockercompose. I then committed regularly as I changed things and debugged the running of my application in the container. 

## Successful running of the applications and if not, debugging measures applied.
I managed to run my application in my container after much debugging. I first had issues with my mongodb connection which I troubleshooted by changing the ports and connection string. I then had issues because I am using the node:alpine image and had to add a parameter to the react start script. Finally, I had to remap my ports so that the client and backend are running on different ports in the container and can then communcate with each other. 

## Good practices such as Docker image tag naming standards for ease of identification of images and containers. 