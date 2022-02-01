FROM node:14-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# build target will be in container /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# will start by default because base image will already do this