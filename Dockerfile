FROM node:16-alpine AS builder  
# need to specify alpine version to avoid bugs, as shown above

WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

