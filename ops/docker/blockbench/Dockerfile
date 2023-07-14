FROM node:16.6.2-alpine3.14

ENV CI=true
ENV HOST=0.0.0.0
ENV PORT=3000

WORKDIR /var/www/blockbench

COPY ./blockbench ./

RUN apk add py3-pip \
        make \
        g++

EXPOSE 3000
CMD ["sh", "-c", "npm install && npm run dev"]