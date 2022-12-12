FROM node:19.2-alpine AS build

#creating the client directory
WORKDIR /client

#install our dependencies - we copy the package file so that we can use caching in the layers
COPY package*.json ./

#get packages and make sure we only install what is required
RUN  npm install

#now we can copy all the src files we need
COPY . .

#finally we use a distroless build stage to reduce the image size
FROM node:19.2-alpine
COPY --from=build /client /client
WORKDIR /client
CMD npm start










