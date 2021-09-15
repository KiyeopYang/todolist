FROM node:14-alpine AS build

ENV NODE_ENV production
ENV PORT 3000

RUN apk add --no-cache python g++ make
WORKDIR /app

COPY . .

RUN npm install --production && npm run build

FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
