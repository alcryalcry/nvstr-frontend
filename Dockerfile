FROM node:14

#args
ARG APP_ENV

RUN echo $APP_ENV

# create destination directory
RUN mkdir -p /usr/src/nvstr-app
WORKDIR /usr/src/nvstr-app

# copy the app, note .dockerignore
COPY . /usr/src/nvstr-app/
RUN yarn

# env
RUN echo $APP_ENV > .env

# build necessary, even if no static files are needed,
# since it builds the server as well
RUN yarn build

# expose 4444 on container
EXPOSE 4444

# set app serving to permissive / assigned
ENV NUXT_HOST=0.0.0.0
# set app port
ENV NUXT_PORT=4444

# start the app
CMD [ "yarn", "start" ]
