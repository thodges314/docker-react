FROM node:alpine

# builder step
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

# runner step 
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
