FROM node:alpine
COPY . /build/yapi
WORKDIR /build/yapi
RUN echo '{"versionNotify":false}' > /build/config.json \
  && npm install ykit node-sass react-dnd react-dnd-html5-backend vm2 --package-lock-only --registry=https://registry.npm.taobao.org \
  && npm ci --registry=https://registry.npm.taobao.org \
  && npm run build-client
EXPOSE 3000
CMD ["node", "./server/app.js"]