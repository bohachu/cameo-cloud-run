FROM node:alpine
RUN apk update && \
	wget https://github.com/keplergl/kepler.gl/archive/refs/heads/master.zip && \
	unzip master.zip && \
	mv kepler.gl-master kepler.gl
WORKDIR /kepler.gl/examples/custom-reducer/
RUN yarn install && \
	sed -i 's/webpack-dev-server --progress/webpack-dev-server --host 0.0.0.0 --progress/g' package.json
WORKDIR /kepler.gl/examples/custom-reducer/src/
RUN sed -i 's/const MAPBOX_TOKEN = process.env.MapboxAccessToken;/const MAPBOX_TOKEN = "pk.eyJ1IjoiYm93ZW5jaGl1IiwiYSI6ImNrNzh3bjA3YzAwNWszZW5zc2doZGNqZGwifQ.o_MrY1UR1GjqQO8nD5lJVQ";/g' app.js
WORKDIR /kepler.gl/examples/custom-reducer/
CMD ["yarn","start"]
