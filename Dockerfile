FROM node:18-bookworm

WORKDIR /app

COPY . .

RUN npm install -g pnpm


ENV NODE_OPTIONS=--max_old_space_size=4096

RUN pnpm bootstrap

EXPOSE 3000
# Use the production environment

RUN pnpm --filter=nc-gui run build 


CMD [ "pnpm", "--filter=nc-gui", "run", "start", "--", "--hostname", "0.0.0.0" ]