FROM node:18-bullseye
WORKDIR /app
COPY . .
RUN npm config set registry https://registry.npmmirror.com
RUN npm install -g pnpm && pnpm config set registry https://registry.npmmirror.com
# 这一步会在你外网的电脑上，在容器所在的虚拟 Linux 环境里下载并编译完美的依赖包！
RUN pnpm install --shamefully-hoist --force
EXPOSE 18789
CMD ["node", "scripts/run-node.mjs", "gateway", "--allow-unconfigured"]
