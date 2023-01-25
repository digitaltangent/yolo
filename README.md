# Description
This project is an eCommerce application built  on the MERN stack and is used for the Devops IP #2 and IP#4

## How to run the project with docker  
Make sure you have docker installed
Clone the project 
Navigate to the folder where you cloned
Open the terminal and type: 'docker compose up'
The project will pull the required containers from Docker Hub and will set up your environment in a docker container

## Tagging and versioning
aleedaf/yolo:client is the frontend client
aleedaf/yolo:backend is the backend server
The current version tag is 1.2.3

## Accessing through GKE
The images created from this repository have been deployed to containers in GKE and are available at this external service IP: http://34.165.125.186:3000/
