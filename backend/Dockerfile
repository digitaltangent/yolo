FROM node:19.2-alpine 

#creating the client directory
WORKDIR "/backend"

#install our dependencies - we copy the package file so that we can use caching in the layers
COPY package*.json ./

#get packages and make sure we only install what is required
RUN npm install 

#now we can copy all the src files we need
COPY . .

CMD npm start




