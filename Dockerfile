# ==== CONFIGURE =====
# Use a Node base image (for smallest size we are using Alpine)
FROM node:19.2-alpine 

# Copy the yolo files to the image
COPY . .

#Change to the client directory
WORKDIR "/client"
COPY . .
RUN npm install
RUN npm start

#Change to the client directory
WORKDIR "/backend"
COPY . .
RUN npm install
RUN npm start



