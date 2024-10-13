FROM node:22-slim AS base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
WORKDIR /app
RUN apt-get update
RUN apt-get install openssl -y

FROM base AS dependencies
COPY . /app/
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --prod --frozen-lockfile

FROM base
COPY --from=dependencies /app/node_modules /app/node_modules
COPY --from=dependencies /app/package.json /app/
COPY prisma /app/prisma

EXPOSE 5555

CMD [ "npm", "start" ]
